package org.zerock.air.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.board.service.BoardService;
import org.zerock.board.vo.BoardVO;

import com.webjjang.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/air")
@Log4j
public class AirController {
	
	@Autowired
	@Qualifier("BoardServiceImpl")
	private BoardService service;
	
	// 1. 항공권 메인 화면
	@GetMapping("/main.do")
	public String main(Model model, HttpServletRequest request) throws Exception {
		log.info("AirController.main() --------------------------");
		
		return "air/main";
	} // end of list()

	
}
