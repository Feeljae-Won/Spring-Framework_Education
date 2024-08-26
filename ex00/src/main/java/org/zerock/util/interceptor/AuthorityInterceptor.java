package org.zerock.util.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.zerock.member.vo.LoginVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuthorityInterceptor extends HandlerInterceptorAdapter{
	
	// 권한 정보가 들어있는 Map 생성 map<uri, 등급>
	private Map<String, Integer> authMap = new HashMap<String, Integer>();
	
	// 권한 정보를 등록하는 초기화 블록
	{
		// 등급이 1 이면 로그인 필요
		// 등급이 9 이면 로그인 + 관리자 권한 필요
		
		// 회원관리
		authMap.put("/member/logout.do", 1);
		
		// 댓글 권한 처리
		authMap.put("/boardreply/write.do", 1);
		authMap.put("/boardreply/update.do", 1);
		authMap.put("/boardreply/delete.do", 1);

		// 상품 관리 권한 처리 - 페이지 권한
		authMap.put("/goods/writeForm.do", 9); // 상품 등록 폼
		authMap.put("/goods/write.do", 9); // 상품 등록 처리
		authMap.put("/goods/updateForm.do", 9); // 상품 수정 폼
		authMap.put("/goods/update.do", 9); // 상품 수정 처리
		authMap.put("/goods/delete.do", 9); // 상품 삭제 처리
		authMap.put("/goods/changeImage.do", 9);
		authMap.put("/goods/addSize.do", 9);
		authMap.put("/goods/addColor.do", 9);
		authMap.put("/goods/changePrice.do", 9);
		
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)	throws Exception {
	
		// 권한 처리 진행
		log.info("--------------------------- 권한 처리 Interceptor -----------------------------");
		
		// 로그인 유무 확인 - 사용자 등급 번호(login - session), 페이지 권한 필요(authMap)
		// 페이지 권한 가져오기
		String uri = request.getRequestURI();
		Integer pageGradeNo = authMap.get(uri);
		
		// 로그인이 필요한 경우
		if (pageGradeNo != null) {
			// 세션으로 부터 정보 가져오기
			HttpSession session = request.getSession();
			LoginVO vo = (LoginVO) session.getAttribute("login");
			
			// 로그인을 안한 경우
			if (vo == null) {
				// 권한 오류 JSP로 이동 시킨다.
				request.getRequestDispatcher("/WEB-INF/views/error/loginError.jsp").forward(request, response);
				
				return false;
			}
			// 페이지 권한 확인
			Long userGradeNo = vo.getGradeNo();
			if(pageGradeNo > userGradeNo) {
				request.getRequestDispatcher("/WEB-INF/views/error/authError.jsp").forward(request, response);
			};
		}
		// 요청한 내용을 계속 진행 - 적합한 권한인 경우
		return super.preHandle(request, response, handler);
	} // end of preHandle

}
