package org.zerock.category.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
// import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.category.service.CategoryService;
import org.zerock.category.vo.CategoryVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/category")
@Log4j
public class CategoryController {

	// 자동 DI
	// @Setter(onMethod_ = @Autowired)
	// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
	@Autowired
	@Qualifier("categoryServiceImpl")
	private CategoryService service;
	
	//--- 카테고리 리스트 ------------------------------------
	@GetMapping("/list.do")
	// public ModelAndView list(Model model) {
	public String list(@RequestParam(defaultValue = "0") Integer cate_code1,
			Model model){
		// 대분류 가져오기.
		List<CategoryVO> bigList = service.list(0);
		
		// cate_code1이 없으면 cate_code1 중에서 제일 작은것 가져와서 처리
		if(cate_code1 == 0 && (bigList != null && bigList.size() != 0))
			cate_code1 = bigList.get(0).getCate_code1();
		
		// 중분류 가져오기
		List<CategoryVO> midList = service.list(cate_code1);
		
		// model에 담으로 request에 자동을 담기게 된다. - 처리된 데이터를 Model에 저장
		model.addAttribute("bigList", bigList);
		model.addAttribute("midList", midList);
		
		return "category/list";
	}
	
	//--- 카테고리 글등록 폼 ------------------------------------
	// 등록 항목이 분류명밖에 없다. 리스트에 포함 시키자.
	
	//--- 카테고리 글등록 처리 ------------------------------------
	@PostMapping("/write.do")
	public String write(CategoryVO vo, RedirectAttributes rttr) {
		log.info("write.do");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "카테고리 글등록이 되었습니다.");
		
		return "redirect:list.do";
	}
	
	//--- 카테고리 글수정 폼 ------------------------------------
	// 등록 항목이 분류명밖에 없다. 리스트에 포함 시키자.
	
	//--- 카테고리 글수정 처리 ------------------------------------
	@PostMapping("/update.do")
	public String update(CategoryVO vo, RedirectAttributes rttr) {
		log.info("update.do");
		log.info(vo);
		if(service.update(vo) == 1)
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "카테고리 글수정이 되었습니다.");
		else
			rttr.addFlashAttribute("msg",
					"카테고리 글수정이 되지 않았습니다. "
					+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
		
		return "redirect:list.do?no=0";
	}
	
	
	//--- 카테고리 글삭제 처리 ------------------------------------
	@PostMapping("/delete.do")
	public String delete(CategoryVO vo, RedirectAttributes rttr) {
		log.info("delete.do");
		log.info(vo);
		// 처리 결과에 대한 메시지 처리
		if(service.delete(vo) == 1) {
			rttr.addFlashAttribute("msg", "카테고리 글삭제가 되었습니다.");
			return "redirect:list.do";
		}
		else {
			rttr.addFlashAttribute("msg",
					"카테고리 글삭제가 되지 않았습니다. "
							+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
			return "redirect:list.do?no=0";
		}
	}
	
}
