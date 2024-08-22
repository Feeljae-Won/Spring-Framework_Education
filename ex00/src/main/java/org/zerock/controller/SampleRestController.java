package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleDTO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

// @Controller, @RestController - uri와 관련. 
// @RestController에는 기본이 @ResponseBody이므로 생략한다. - 전달 되는 데이터가 순수한 데이터이다.
@RestController
@RequestMapping("/sampleRest")
@Log4j
public class SampleRestController {
	
	// ------------------------------- Response (서버 -> 클라이언트) ---------------------------------

	
	@GetMapping(value = "/getTest", produces = "text/plain; charset=UTF-8")
	public String getText() {
		
		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
		return "안녕하세요.";
	}
	
	// DTO 객체를 JSON과 XML 데이터로 처리(제공)
	@GetMapping(value = "/getSample", 
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_XML_VALUE
			})
	public SampleDTO getSample() {
		
		return new SampleDTO("홍길동", 10);
	}
	
	// 리스트 객체를 xml과 json 데이터 제공
	@GetMapping(value = "/getList")
	public List<SampleDTO> getList() {
		
		List<SampleDTO> list = new ArrayList<>();
		
		list.add(new SampleDTO("홍길동", 10));
		list.add(new SampleDTO("손흥민", 33));
		
		return list;
	}
	
	// Map 객체를 xml과 json 데이터 제공
	@GetMapping(value = "/getMap")
	public Map<String, Object> getMap() {
		
		// Map 은 인터페이스, HashMap 은 Class
		// 실행은 인터페이스, 생성은 클래스
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 리스트는 test
		List<SampleDTO> list = new ArrayList<>();
		list.add(new SampleDTO("홍길동", 10));
		list.add(new SampleDTO("손흥민", 33));
		
		// 태그 이름이 "dto"로 나온다.
//		map.put("dto1", new SampleDTO("홍길동", 10));
		
		// 특성이 서로 다른 여러개의 데이터를 담아서 넘길 때 
		map.put("list", list);
		map.put("pageObject", new PageObject());
		
		return map;
	}
	
	// ------------------------------- Request (클라이언트 -> 서버) ---------------------------------
	
	// URI 안에 데이터 포함시켜서 전달하기
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(@PathVariable("cat") String cat,@PathVariable("pid") Integer pid) {
		
		return new String[] {"category : " + cat, "productid : " + pid};
	}
	
	// JS의 JSON 데이터를 만들어서 문자열로 보내면 받을 수 있다.
	@PostMapping("/sample")
	public SampleDTO convert(@RequestBody SampleDTO dto) {
		
		return dto;
	}
	
	
	
}
