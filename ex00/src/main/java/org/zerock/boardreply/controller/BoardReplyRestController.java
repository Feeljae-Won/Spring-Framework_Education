package org.zerock.boardreply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.boardreply.service.BoardReplyService;
import org.zerock.boardreply.vo.BoardReplyVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

//자동 생성 - @Controller, @RestController, @Service, @Repository, @Component(구성), @~Advice(예외처리)
@RestController
@RequestMapping("/boardReply")
@Log4j
public class BoardReplyRestController {
	
	// 자동 DI
//	@Setter(onMethod_= @Autowired)
	@Autowired
	@Qualifier("BoardReplyServiceImpl")
	private BoardReplyService service;
	
	// 1. 리스트 - GET
	// 넘겨주는 데이터는 기본이 XML로 보내고 JS 에서 JSON 으로 변환한다.
	@GetMapping(value = "/list.do",
			produces = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE
		})
	public ResponseEntity<Map<String, Object>> list(PageObject pageObject, Long no) {
		log.info("list - page : " + pageObject.getPage() + ", no : " + no);
		
		// DB 에서 데이터를 가져와서 넘겨 준다.
		List<BoardReplyVO> list = service.list(pageObject, no);
		log.info("controller - service()");
	
		// list와 PageObject를 넘겨야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageObject", pageObject);
		
		// list와 pageObject의 데이터 확인
		log.info("After - map : " + map); 
		
		// ResponseEntity : 통신 상태를 확인하기 위해 ResponseEntity를 사용한다. 데이터 보내는 것 뿐만 아닌 상태까지 보낼 수 있다.
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	// 2. 등록 - POST
	@PostMapping(value = "/write.do", 
			consumes = "application/json", // no, content
			produces = "text/plain; charset=utf-8"
			)
	// BoardReplyVO - 글번호(no), 내용 (content) + id : Json 데이터로 한개로 넘어온다.
	// JSON 데이터 처리를 하려면 @RequestBody를 써야한다.
	public ResponseEntity<String> write(@RequestBody BoardReplyVO vo, HttpSession session) {

		// 로그인이 되어 있어야 사용할 수 있다.
		vo.setId(getId(session)); // 현재는 test만 나온다. 로그인을 확인하지 않아도 된다.
		
		service.write(vo);
		
		return new ResponseEntity<String>("댓글 등록이 처리 되었습니다.", HttpStatus.OK);
	}
	
	// 3. 수정 - POST
	@PostMapping(value = "/update.do", 
			consumes = "application/json", // rno, content
			produces = "text/plain; charset=utf-8"
			)
	// BoardReplyVO - 글번호(no), 내용 (content) + id : Json 데이터로 한개로 넘어온다.
	// JSON 데이터 처리를 하려면 @RequestBody를 써야한다.
	public ResponseEntity<String> update(@RequestBody BoardReplyVO vo, HttpSession session) {
		
		// 로그인이 되어 있어야 사용할 수 있다.
		vo.setId(getId(session)); // 현재는 test만 나온다. 로그인을 확인하지 않아도 된다.
		
		Integer result = service.update(vo);
		if (result == 1) 			
			return new ResponseEntity<String>("댓글이 수정 되었습니다.", HttpStatus.OK);
		 else 
			 return new ResponseEntity<String>("댓글이 수정 되지 않았습니다.<br>댓글 번호나 로그인 정보를 확인해 주세요.", HttpStatus.BAD_REQUEST);
	}
	
	// 4. 삭제 - GET
	@GetMapping(value = "/delete.do", 
			produces = "text/plain; charset=utf-8"
			)
	public ResponseEntity<String> delete(BoardReplyVO vo, HttpSession session) {
		
		// 로그인이 되어 있어야 사용할 수 있다.
		vo.setId(getId(session)); // 현재는 test만 나온다. 로그인을 확인하지 않아도 된다.
		
		Integer result = service.delete(vo);
		
		if (result == 1) 			
			return new ResponseEntity<String>("댓글이 삭제 되었습니다.", HttpStatus.OK);
		 else 
			 return new ResponseEntity<String>("댓글이 삭제 되지 않았습니다.<br>댓글 번호나 로그인 정보를 확인해 주세요.", HttpStatus.BAD_REQUEST);
	}
	
	private String getId(HttpSession session) {
		// LoginVO vo = (LoginVO)session.getAttribute("login");
		// String id = vo.getId()
		return "test"; // 강제 로그인 처리해서 test로 하드코딩했다.
	}
}
