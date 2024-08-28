package org.zerock.ajax.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.air.service.AirService;
import org.zerock.air.vo.AirVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/ajax")
@Log4j
public class AjaxController {
	
	// 자동 DI
	// @Setter(onMethod_= @Autowired)
	@Autowired
	@Qualifier("AirServiceImpl")
	private AirService service;
	
	// 1. 리스트 - GET
	// 넘겨주는 데이터는 기본이 XML로 보내고 JS 에서 JSON 으로 변환한다.
	@GetMapping(value = "/searchAirport.do",
			produces = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE
		})
	public ResponseEntity<Map<String, Object>> searchAirport(PageObject pageObject,String searchAirport) {
		log.info("list - data : " + searchAirport);
		
		// DB 에서 데이터를 가져와서 넘겨 준다.
		List<AirVO> list = service.list(pageObject, searchAirport);
		log.info("controller - service()");
	
		// list와 PageObject를 넘겨야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("airport", list);
		map.put("pageObject", pageObject);
		
		// list와 pageObject의 데이터 확인
		log.info("After - map : " + map); 
		
		// ResponseEntity : 통신 상태를 확인하기 위해 ResponseEntity를 사용한다. 데이터 보내는 것 뿐만 아닌 상태까지 보낼 수 있다.
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}

}
