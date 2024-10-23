package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.air.service.AirService;
import org.zerock.category.service.CategoryService;
import org.zerock.goods.service.GoodsService;
import org.zerock.psrefree.service.PSRefreeService;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@RequestMapping("/ajax")
@Controller
@Log4j
public class AjaxController {
	
	// 자동 DI
	// @Setter(onMethod_ = @Autowired)
	// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
	@Autowired
	@Qualifier("categoryServiceImpl")
	private CategoryService categoryService;
	
	@Autowired
	@Qualifier("goodsServiceImpl")
	private GoodsService goodsService;
	
	@Autowired
	@Qualifier("airServiceImpl")
	private AirService airService;
	
	@Autowired
	@Qualifier("PSRefreeServiceImpl")
	private PSRefreeService psRefreeService;
	
	@GetMapping("/getCourtList.do")
	public String getCourt(Model model, Long court) {
		
		model.addAttribute("courtList", psRefreeService.getCourtList(court));
		
		return "psRefree/getCourt";
	}
	
	//--- 공항 가져오기 ------------------------------------
	@GetMapping("/getAirport.do")
	public String getAirport(Model model, String countryCode) {
		log.info("getAirport.do");
		// 중분류를 가져와서 JSP로 넘기기
		model.addAttribute("airportList", airService.getAirport(countryCode));
		// midList.jsp 에 select tag 작성
		return "air/getAirport";
	}
	
	//--- 항공편 가져오기 ------------------------------------
	@GetMapping("/getAirplane.do")
	public String getAirplane(Model model, String airplanePdt) {
		log.info("getAirplane.do");
		// 중분류를 가져와서 JSP로 넘기기
		model.addAttribute("airplaneList", airService.getAirplane(airplanePdt));
		// midList.jsp 에 select tag 작성
		return "air/getAirplane";
	}
	
	//--- 관리자 기종 상세보기 ------------------------------------
	@GetMapping("/getFlightInfo.do")
	public String getFlightInfo(Model model, String flightName) {
		log.info("getFlightInfo.do");
		
		model.addAttribute("info", airService.getFlightInfo(flightName));
		
		return "air/getFlightInfo";
	}
	
	//--- 노선에 따른 금액 가져오기 ------------------------------------
	@GetMapping("/getPrice.do")
	public String getPrice(Model model, Long airlineNo, Long routeId) {
		log.info("getPrice.do");
		// 중분류를 가져와서 JSP로 넘기기
		model.addAttribute("priceInfo", airService.getPrice(airlineNo, routeId));
		// midList.jsp 에 select tag 작성
		return "air/getPrice";
	}
	
	//--- 스케줄 등록 - 스케줄 없는 항공편 리스트 ------------------------------------
	@GetMapping("/getFlightList.do")
	public String getFlightList(Model model, Long airlineNo) {
		log.info("getFlightList.do");
		// 중분류를 가져와서 JSP로 넘기기
		model.addAttribute("flightList", airService.getFlightList(airlineNo));
		// midList.jsp 에 select tag 작성
		return "air/getFlightList";
	}

	//--- 상품관리 중분류 가져오기 ------------------------------------
	@GetMapping("/getMidList.do")
	public String getMidList(Model model, Integer cate_code1) {
		log.info("getMidList.do");
		// 중분류를 가져와서 JSP로 넘기기
		model.addAttribute("midList", categoryService.list(cate_code1));
		// midList.jsp 에 select tag 작성
		return "goods/midList";
	}
	
	//--- 상품관리 사이즈 가져오기 ------------------------------------
	@GetMapping("/getSize.do")
	public String getSize(Model model, Integer cate_code1) {
		log.info("getSize.do");
		// 중분류를 가져와서 JSP로 넘기기
		model.addAttribute("sizeList", goodsService.getSize(cate_code1));
		// midList.jsp 에 select tag 작성
		return "goods/sizeList";
	}
	
	//--- 상품관리 색상 가져오기 ------------------------------------
	@GetMapping("/getColor.do")
	public String getColor(Model model, Integer cate_code1) {
		log.info("getColor.do");
		// 중분류를 가져와서 JSP로 넘기기
		model.addAttribute("colorList", goodsService.getColor(cate_code1));
		// midList.jsp 에 select tag 작성
		return "goods/colorList";
	}
	
	
}
