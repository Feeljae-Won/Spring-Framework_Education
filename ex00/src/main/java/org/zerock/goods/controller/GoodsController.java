package org.zerock.goods.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.goods.service.GoodsService;
import org.zerock.goods.vo.GoodsVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/goods")
@Log4j
public class GoodsController {
	
	// 자동 DI
//	@Setter(onMethod_ = @Autowired)
	// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
	@Autowired
	@Qualifier("GoodsServiceImpl")
	private GoodsService service;
	
//	// 1. 상품관리 리스트
	@GetMapping("/list.do")
	public String list(Model model, HttpServletRequest request) throws Exception {
		log.info("GoodsController.list() --------------------------");
		
		// 서비스 실행
//		request.setAttribute("list", service.list());
		
		// 페이지 처리를 위한 객체 생성
		PageObject pageObject = PageObject.getInstance(request);
		
		// model에 담으면 request에 자동으로 담기게 된다. - 처리된 데이터를 Model로 저장
		model.addAttribute("list", service.list(pageObject));
		log.info(pageObject);
		model.addAttribute("pageObject", pageObject);
		
		return "goods/list";
	} // end of list()
	
	// model을 이용한 데이터 전달
	// 1. 상품관리 리스트
//	@GetMapping("/list.do")
//	public ModelAndView list(Model model) {
//	public String list(Model model) {
//		log.info("GoodsController.list() --------------------------");
		
		// model에 담으면 request에 자동으로 담기게 된다. - 처리된 데이터를 Model로 저장
//		model.addAttribute("list", service.list());
//		return "goods/list";
		
		// ModelAndView
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", service.list());
//		mav.setViewName("goods/list");
//		
//		return mav;
//	} // end of list()
	
	// 2. 상품관리 글 보기
	@GetMapping("/view.do")
	public String view(Long no, Long inc, Model model) {
		log.info("GoodsController.view() --------------------------");
		
		model.addAttribute("vo", (GoodsVO) service.view(no, inc));
		
		return "goods/view";
	} // end of view()
	
	// 3-1. 상품관리 글 등록 폼
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("GoodsController.writeForm() --------------------------");
		
		return "goods/writeForm";
	} // end of writeForm()
	
	// 3-2. 상품관리 글 등록 처리
	@PostMapping("/write.do")
	public String write(GoodsVO vo, RedirectAttributes rttr) {
		log.info("GoodsController.write() --------------------------");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메세지 처리
		rttr.addFlashAttribute("msg", "상품관리 글 등록이 되었습니다.");
		
		return "redirect:list.do";
	} // end of write()
	
	// 4-1. 상품관리 글 수정 폼
	@GetMapping("/updateForm.do")
	public String updateForm(Long no, Long inc, Model model) {
		log.info("GoodsController.updateForm() --------------------------");
		
		model.addAttribute("vo", (GoodsVO) service.view(no, inc));
		
		return "goods/updateForm";
	} // end of updateForm()
	
	// 4-2. 상품관리 글 수정 처리
	@PostMapping("/update.do")
	public String update(GoodsVO vo, RedirectAttributes rttr) {
		System.out.println("GoodsController.update() --------------------------");
		
		
		if (service.update(vo) == 1)
			// 처리 결과에 대한 메세지 처리
			rttr.addFlashAttribute("msg", "상품관리 글 수정 되었습니다.");
		else
			rttr.addFlashAttribute("msg", "상품관리 글 수정이 되지 않았습니다. <br> 글 번호나 비밀번호가 일치하지 않습니다."
					+ "<br> 다시 확인하고 시도해 주세요.");
			
		
		return "redirect:view.do?no=&inc=0";
	} // end of updateForm()
	
	// 5. 글 삭제 처리
	@PostMapping("/delete.do")
	public String delete(GoodsVO vo, RedirectAttributes rttr) {
		System.out.println("GoodsController.delete() --------------------------");
		
		
		if (service.delete(vo) == 1) {
			// 처리 결과에 대한 메세지 처리
			rttr.addFlashAttribute("msg", "상품관리 글 수정 되었습니다.");
			
			return "redirect:list.do";
		}
		else {
			rttr.addFlashAttribute("msg", "상품관리 글 삭제되지 않았습니다. <br> 글 번호나 비밀번호가 일치하지 않습니다."
					+ "<br> 다시 확인하고 시도해 주세요.");
		
			return "redirect:view.do?no=&inc=0";
		}
	} // end of delete()
	
}
