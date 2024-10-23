package org.zerock.psrefree.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.psrefree.service.PSRefreeService;
import org.zerock.psrefree.vo.RefreeVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/psRefree")
@Log4j
public class PSRefreeController {
	
	@Autowired
	@Qualifier("PSRefreeServiceImpl")
	private PSRefreeService service;
	
	@GetMapping("/main.do")
	public String main() {
		
		// 레프리 등록 화면
		
		return "psRefree/main";
	}
	
	@PostMapping("/write.do")
	public String write(RefreeVO list, RedirectAttributes rttr) {
		
		log.info(list.getList());
		
		if (service.write(list) == 0) {
			rttr.addFlashAttribute("msg","기존 목록이 삭제되지 않았습니다. 심판 등록에 실패했습니다.");
		} else rttr.addFlashAttribute("msg", "심판 목록이 새로 등록 되었습니다.");
		
		return "redirect:/psRefree/list.do";
	}
	
	@GetMapping("/list.do")
	public String list(Model model) {
		
		model.addAttribute("vo", service.list());
		
		return "psRefree/list";
	}

}
