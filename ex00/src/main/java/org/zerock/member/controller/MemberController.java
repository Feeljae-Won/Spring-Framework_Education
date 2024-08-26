package org.zerock.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.member.service.MemberService;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	// 자동 DI
//	@Setter(onMethod_ = @Autowired)
	// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
	@Autowired
	@Qualifier("MemberServiceImpl")
	private MemberService service;
	
//	// 1. 회원 관리 리스트
	@GetMapping("/list.do")
	public String list(Model model, HttpServletRequest request) throws Exception {
		log.info("MemberController.list() --------------------------");
		
		// 서비스 실행
//		request.setAttribute("list", service.list());
		
		// 페이지 처리를 위한 객체 생성
		PageObject pageObject = PageObject.getInstance(request);
		
		// model에 담으면 request에 자동으로 담기게 된다. - 처리된 데이터를 Model로 저장
		model.addAttribute("list", service.list(pageObject));
		log.info(pageObject);
		model.addAttribute("pageObject", pageObject);
		
		return "member/list";
	} // end of list()
	
	// 2. 회원 관리 - 회원 정보 보기
	@GetMapping("/view.do")
	public String view(Long no, Long inc, Model model) {
		log.info("MemberController.view() --------------------------");
		
		model.addAttribute("vo", (MemberVO) service.view(no, inc));
		
		return "member/view";
	} // end of view()
	
	// 3-1. 회원 관리 - 회원 가입 폼
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("MemberController.writeForm() --------------------------");
		
		return "member/writeForm";
	} // end of writeForm()
	
	// 3-2. 회원 관리 - 회원 가입 처리
	@PostMapping("/write.do")
	public String write(MemberVO vo, RedirectAttributes rttr) {
		log.info("MemberController.write() --------------------------");
		log.info(vo);
		service.write(vo);
		
		// 처리 결과에 대한 메세지 처리
		rttr.addFlashAttribute("msg", "회원 관리 글 등록이 되었습니다.");
		
		return "redirect:list.do";
	} // end of write()
	
	// 4-1. 회원 관리 - 회원 정보 수정 폼
	@GetMapping("/updateForm.do")
	public String updateForm(Long no, Long inc, Model model) {
		log.info("MemberController.updateForm() --------------------------");
		
		model.addAttribute("vo", (MemberVO) service.view(no, inc));
		
		return "member/updateForm";
	} // end of updateForm()
	
	// 4-2. 회원 관리 - 회원 정보 수정 처리
	@PostMapping("/update.do")
	public String update(MemberVO vo, RedirectAttributes rttr) {
		System.out.println("MemberController.update() --------------------------");
		
		if (service.update(vo) == 1)
			// 처리 결과에 대한 메세지 처리
			rttr.addFlashAttribute("msg", "회원 관리 글 수정 되었습니다.");
		else
			rttr.addFlashAttribute("msg", "회원 관리 글 수정이 되지 않았습니다. <br> 글 번호나 비밀번호가 일치하지 않습니다."
					+ "<br> 다시 확인하고 시도해 주세요.");
			
		return "redirect:view.do?id=" + vo.getId();
	} // end of updateForm()
	
	// 5. 회원 관리 - 삭제 처리
	@PostMapping("/delete.do")
	public String delete(MemberVO vo, RedirectAttributes rttr) {
		System.out.println("MemberController.delete() --------------------------");
		
		
		if (service.delete(vo) == 1) {
			// 처리 결과에 대한 메세지 처리
			rttr.addFlashAttribute("msg", "회원 관리 글 수정 되었습니다.");
			
			return "redirect:list.do";
		}
		else {
			rttr.addFlashAttribute("msg", "회원이 삭제되지 않았습니다. <br> 글 번호나 비밀번호가 일치하지 않습니다."
					+ "<br> 다시 확인하고 시도해 주세요.");
		
			return "redirect:view.do?id=" + vo.getId();
		}
	} // end of delete()
	
	
	// 6-1. 로그인 폼 이동
	@GetMapping("/loginForm.do")
	public String loginForm() {
		log.info("MemberController.loginForm() --------------------------");
		
		return "member/loginForm";
	} // end of writeForm()
	
	// 6-2. 회원 관리 - 로그인 처리
	@PostMapping("/login.do")
	public String login(LoginVO vo, HttpSession session, RedirectAttributes rttr) {
		log.info("MemberController.login() --------------------------");
		
		LoginVO loginVO = service.login(vo);
		
		// 로그인이 안됬을 경우 - 메세지를 한번말 뿌리고 지운다.
		if(loginVO == null) {
			rttr.addFlashAttribute("msg", "로그인 정보가 맞지 않습니다. <br> ID나 비밀번호 확인 후 다시 시도해 주세요.");
			return "redirect:/member/loginForm.do";
		}
		
		// 로그인이 된 경우
		session.setAttribute("login", loginVO);
		rttr.addFlashAttribute("msg", loginVO.getName() + " (" + loginVO.getGradeName() + ") 님, 로그인 되었습니다.");
		
		return "redirect:/main/main.do";
	} // end of view()
	
}
