package org.zerock.goods.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.servlet.ModelAndView;
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
	// @Setter(onMethod_ = @Autowired)
	// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
	@Autowired
	@Qualifier("goodsServiceImpl")
	private GoodsService service;
	
	//--- 상품 리스트 ------------------------------------
	@GetMapping("/list.do")
	// 검색을 위한 데이터를 따로 받아야 한다.
	// public ModelAndView list(Model model) {
	public String list(Model model, HttpServletRequest request)
			throws Exception {
	//	public String list(HttpServletRequest request) {
		log.info("list.do");
		// request.setAttribute("list", service.list());
		
		// 페이지 처리를 위한 객체 생겅
		PageObject pageObject = PageObject.getInstance(request);
		
		// 한 페이지 당 보여주는 데이터의 개수가 없으면 기본은 8로 정한다.
		String strPerPageNum = request.getParameter("perPageNum");
		if(strPerPageNum == null || strPerPageNum.equals(""))
			pageObject.setPerPageNum(8);
		
		// model에 담으로 request에 자동을 담기게 된다. - 처리된 데이터를 Model에 저장
		model.addAttribute("list", service.list(pageObject));
		// pageObject에 데이터 가져 오기 전에는 시작 페이지, 끝 페이지, 전체 페이지가 정해지지 않는다.
		log.info(pageObject);
		model.addAttribute("pageObject", pageObject);
		// 검색에 대한 정보도 넘겨야 한다.
		
		return "goods/list";
	}
	
	//--- 상품관리 글보기 ------------------------------------
	@GetMapping("/view.do")
	public String view(Model model, Long no, int inc) {
		log.info("view.do");
		
		model.addAttribute("vo", service.view(no, inc));
		
		return "goods/view";
	}
	
	//--- 상품관리 글등록 폼 ------------------------------------
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("writeForm.do");
		return "goods/writeForm";
	}
	
	//--- 상품관리 글등록 처리 ------------------------------------
	@PostMapping("/write.do")
	public String write(GoodsVO vo, RedirectAttributes rttr) {
		log.info("write.do");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "상품관리 글등록이 되었습니다.");
		
		return "redirect:list.do";
	}
	
	//--- 상품관리 글수정 폼 ------------------------------------
	@GetMapping("/updateForm.do")
	public String updateForm(Long no, Model model) {
		log.info("updateForm.do");
		
		model.addAttribute("vo", service.view(no, 0));
		
		return "goods/updateForm";
	}
	
	//--- 상품관리 글수정 처리 ------------------------------------
	@PostMapping("/update.do")
	public String update(GoodsVO vo, RedirectAttributes rttr) {
		log.info("update.do");
		log.info(vo);
		if(service.update(vo) == 1)
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "상품관리 글수정이 되었습니다.");
		else
			rttr.addFlashAttribute("msg",
					"상품관리 글수정이 되지 않았습니다. "
					+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
		
		return "redirect:view.do?no=&inc=0";
	}
	
	
	//--- 상품관리 글삭제 처리 ------------------------------------
	@PostMapping("/delete.do")
	public String delete(GoodsVO vo, RedirectAttributes rttr) {
		log.info("delete.do");
		log.info(vo);
		// 처리 결과에 대한 메시지 처리
		if(service.delete(vo) == 1) {
			rttr.addFlashAttribute("msg", "상품관리 글삭제가 되었습니다.");
			return "redirect:list.do";
		}
		else {
			rttr.addFlashAttribute("msg",
					"상품관리 글삭제가 되지 않았습니다. "
							+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
			return "redirect:view.do?no=&inc=0";
		}
	}
	
}
