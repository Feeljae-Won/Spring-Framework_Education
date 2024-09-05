package org.zerock.air.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.air.service.AirService;
import org.zerock.air.vo.AirVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/air")
@Log4j
public class AirController {
	
	// 자동 DI
	// @Setter(onMethod_= @Autowired)
	@Autowired
	@Qualifier("AirServiceImpl")
	private AirService service;
	
	// 1. 항공 메인
	@GetMapping("/main.do")
	public String list() throws Exception {
		log.info("AirController.main() --------------------------");
		
		return "air/main";
	} // end of list()
	
	// 1-1. 예약 조회
	@GetMapping("/searchReservation.do")
	public String searchReservation() throws Exception {
		log.info("AirController.searchReservation() --------------------------");
		
		return "air/searchReservation";
	} // end of searchReservation()
	
	// 1-2. 출도착 조회
	@GetMapping("/searchSchedule.do")
	public String searchSchedule() throws Exception {
		log.info("AirController.searchSchedule() --------------------------");
		
		return "air/searchSchedule";
	} // end of searchReservation()
	
	
	// 2. 공항 검색 리스트 - GET
	// 넘겨주는 데이터는 기본이 XML로 보내고 JS 에서 JSON 으로 변환한다.
	@GetMapping(value = "/searchAirport",
			produces = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE
		})
	@ResponseBody
	public ResponseEntity<Map<String, Object>> searchAirport(@RequestParam(value = "searchAirport") String searchAirport) {
        
		// DB 에서 데이터를 가져와서 넘겨 준다.
		List<AirVO> list = service.searchList(searchAirport);
		log.info("controller - service()");
	
		// list와 PageObject를 넘겨야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		// list와 pageObject의 데이터 확인
		log.info("After - map : " + map); 
		
		// ResponseEntity : 통신 상태를 확인하기 위해 ResponseEntity를 사용한다. 데이터 보내는 것 뿐만 아닌 상태까지 보낼 수 있다.
	    // DB에서 초성 및 전체 공항명을 함께 검색
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
    }
	
	// 3. 항공권 검색 결과
	@PostMapping("/selectFlight-D.do")
	public String searchResult(AirVO vo, Model model, @RequestParam Map<String, Object> param) {
		
		model.addAttribute("list", service.searchResult(vo));
		model.addAttribute("param", param);
		
		return "air/selectFlight-D";
	}
	
	// 3-1. 항공권 검색 결과 : 왕복인 경우 검색, 편도인 경우 주문 예약으로 데이터 전송
	@PostMapping("/selectFlight-A.do")
	public String searchReturnResult(AirVO vo, Model model, @RequestParam Map<String, Object> param) {
		
		model.addAttribute("list", service.searchResult(vo));
		model.addAttribute("param", param);
		
		// 왕복 체크
		if (param.get("type").equals("왕복")) {
			
			return "air/selectFlight-A";
			
		} else return "air/main";
		
	}
	
	// 4. 관리자 메인
	@GetMapping("/airAdmin.do")
	public String airAdminMain() {
		
		return "air/airAdmin";
	}
	
	// 4-1. 관리자 국가 리스트
	@GetMapping("/airAdminNOC.do")
	public String nocList(String pan, Model model){
		
		// 대륙별 리스트 가져오기
		List<AirVO> asia = service.nocList("ASIA");
		List<AirVO> africa = service.nocList("AFRICA");
		List<AirVO> australia = service.nocList("AUSTRALIA");
		List<AirVO> europe = service.nocList("EUROPE");
		List<AirVO> northAmerica = service.nocList("NORTH AMERICA");
		List<AirVO> southAmerica = service.nocList("SOUTH AMERICA");
		
		// model에 담으로 request에 자동을 담기게 된다. - 처리된 데이터를 Model에 저장
		model.addAttribute("asia", asia);
		model.addAttribute("africa", africa);
		model.addAttribute("australia", australia);
		model.addAttribute("europe", europe);
		model.addAttribute("northAmerica", northAmerica);
		model.addAttribute("southAmerica", southAmerica);
		
		return "air/airAdminNOC";
	}
	
	// 4-2. 관리자 국가 등록
	@PostMapping("/nocWrite.do")
	public String nocWrite(AirVO vo, RedirectAttributes rttr) {
		
		service.nocWrite(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "국가 등록이 정상 처리 되었습니다.");
		
		return "redirect:airAdminNOC.do";
	}
	
	// 4-3. 관리자 국가 수정
	@PostMapping("/nocUpdate.do")
	public String nocUpdate(AirVO vo, RedirectAttributes rttr) {
		if(service.nocUpdate(vo) >= 1)
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "국가 수정이 정상 처리 되었습니다.");
		else
			rttr.addFlashAttribute("msg",
					"국가 수정이 처리 되지 않았습니다."
					+ "국가 정보를 다시 확인하고 시도해 주세요.");
		
		return "redirect:airAdminNOC.do";
	}
	
	// 4-4. 관리자 국가 삭제
	@PostMapping("/nocDelete.do")
	public String nocDelete(AirVO vo, RedirectAttributes rttr) {
		// 처리 결과에 대한 메시지 처리
		if(service.nocDelete(vo) == 1) {
			rttr.addFlashAttribute("msg", "국가 삭제가 정상 처리 되었습니다.");
		}
		else {
			rttr.addFlashAttribute("msg",
					"국가 삭제가 되지 않았습니다. 다시 확인하고 시도해 주세요.");
		}
		return "redirect:airAdminNOC.do";
	}
	
	// 5-1. 관리자 공항 리스트
	@GetMapping("/airAdminAirport.do")
	public String airportList(String pan, Model model){
		
		// 대륙별 리스트 가져오기
		List<AirVO> asia = service.nocList("ASIA");
		List<AirVO> africa = service.nocList("AFRICA");
		List<AirVO> australia = service.nocList("AUSTRALIA");
		List<AirVO> europe = service.nocList("EUROPE");
		List<AirVO> northAmerica = service.nocList("NORTH AMERICA");
		List<AirVO> southAmerica = service.nocList("SOUTH AMERICA");
		
		// model에 담으로 request에 자동을 담기게 된다. - 처리된 데이터를 Model에 저장
		model.addAttribute("asia", asia);
		model.addAttribute("africa", africa);
		model.addAttribute("australia", australia);
		model.addAttribute("europe", europe);
		model.addAttribute("northAmerica", northAmerica);
		model.addAttribute("southAmerica", southAmerica);
		
		return "air/airAdminAirport";
	}
	
	// 6. 관리자 기종 관리
	@GetMapping("/airAdminAirplane.do")
	public String airAdminAirplane(Long airlineNo, Model model, HttpServletRequest request) throws Exception{
		
		PageObject pageObject = PageObject.getInstance(request);
		
		log.info("pageObject.getInstance" + pageObject);
		
		model.addAttribute("flightList", service.flightList(pageObject, 1L));
		model.addAttribute("pageObject", pageObject);
		
		return "air/airAdminAirplane";
	}
	
	// 6. 관리자 기종 등록
	@GetMapping("/airAdminAirplaneWriteForm.do")
	public String airAdminAirplaneWriteForm(String product, Model model){
		
		
		return "air/airAdminAirplaneWriteForm";
	}

}
