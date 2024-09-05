package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.air.service.AirService;
import org.zerock.category.service.CategoryService;
import org.zerock.goods.service.GoodsService;

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
	
	//--- 공항 가져오기 ------------------------------------
	@GetMapping("/getAirport.do")
	public String getAirport(Model model, String countryCode) {
		log.info("getColor.do");
		// 중분류를 가져와서 JSP로 넘기기
		model.addAttribute("airportList", airService.getAirport(countryCode));
		// midList.jsp 에 select tag 작성
		return "air/getAirport";
	}
	
	//--- 공항 가져오기 ------------------------------------
	@GetMapping("/getAirplane.do")
	public String getAirplane(Model model, String airplanePdt) {
		log.info("getColor.do");
		// 중분류를 가져와서 JSP로 넘기기
		model.addAttribute("airplaneList", airService.getAirplane(airplanePdt));
		// midList.jsp 에 select tag 작성
		return "air/getAirplane";
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
