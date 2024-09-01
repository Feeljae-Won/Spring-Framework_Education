package org.zerock.air.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
import org.zerock.air.service.AirService;
import org.zerock.air.vo.AirVO;

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
	public String searchResult(AirVO vo, Model model, 
			@RequestParam("departure") String departure,
			@RequestParam("arrival") String arrival,
			@RequestParam("departureTime") String departureTime,
			@RequestParam("arrivalTime") String arrivalTime,
			@RequestParam("aPassenger") Integer aPassenger,
			@RequestParam("cPassenger") Integer cPassenger,
			@RequestParam("iPassenger") Integer iPassenger,
			@RequestParam("seatGrade") String seatGrade,
			@RequestParam("type") String type
			) {
		
		model.addAttribute("list", service.searchResult(vo));
		model.addAttribute("departure", departure);
		model.addAttribute("arrival", arrival);
		model.addAttribute("departureTime", departureTime);
		model.addAttribute("arrivalTime", arrivalTime);
		model.addAttribute("aPassenger", aPassenger);
		model.addAttribute("cPassenger", cPassenger);
		model.addAttribute("iPassenger", iPassenger);
		model.addAttribute("seatGrade", seatGrade);
		model.addAttribute("type", type);
		
		return "air/selectFlight-D";
	}
	
	// 3-1. 항공권 검색 결과 : 왕복인 경우 검색, 편도인 경우 주문 예약으로 데이터 전송
	@PostMapping("/selectFlight-A.do")
	public String searchReturnResult(AirVO vo, Model model, 
			@RequestParam("departure") String departure,
			@RequestParam("arrival") String arrival,
			@RequestParam("departureTime") String departureTime,
			@RequestParam("arrivalTime") String arrivalTime,
			@RequestParam("paramDepartureTime") String paramDepartureTime,
			@RequestParam("paramArrivalTime") String paramArrivalTime,
			@RequestParam("airlineKor") String airlineKor,
			@RequestParam("flightName") String flightName,
			@RequestParam("aPassenger") Integer aPassenger,
			@RequestParam("cPassenger") Integer cPassenger,
			@RequestParam("iPassenger") Integer iPassenger,
			@RequestParam("seatGrade") String seatGrade,
			@RequestParam("type") String type,
			@RequestParam("departPrice") Long totalPrice
			) {
		
			model.addAttribute("list", service.searchResult(vo));
			model.addAttribute("departure", departure);
			model.addAttribute("arrival", arrival);
			model.addAttribute("departureTime", departureTime);
			model.addAttribute("arrivalTime", departureTime);
			model.addAttribute("paramDepartureTime", paramDepartureTime);
			model.addAttribute("paramArrivalTime", paramArrivalTime);
			model.addAttribute("airlineKor", airlineKor);
			model.addAttribute("flightName", flightName);
			model.addAttribute("aPassenger", aPassenger);
			model.addAttribute("cPassenger", cPassenger);
			model.addAttribute("iPassenger", iPassenger);
			model.addAttribute("seatGrade", seatGrade);
			model.addAttribute("type", type);
			model.addAttribute("departPrice", totalPrice);
			log.info(type);
			if (type.equals("왕복")) {
				return "air/selectFlight-A";
			} else return "air/main";
		
	}

}
