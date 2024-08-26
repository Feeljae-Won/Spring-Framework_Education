package org.zerock.member.service;

import java.util.List;

import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;
import com.webjjang.util.page.PageObject;

public interface MemberService {

	// 회원관리 - 회원 리스트
	public List<MemberVO> list(PageObject pageObject);
	
	// 회원관리 - 회원 정보 보기
	public MemberVO view(Long no, Long inc);
	
	// 회원관리 - 회원 등록
	public Integer write(MemberVO vo);
	
	// 회원관리 -  회원 수정
	public Integer update(MemberVO vo);

	// 회원관리 - 삭제 처리
	public Integer delete(MemberVO vo);
	
	// 회원관리 - 로그인 처리
	public LoginVO login(LoginVO vo);
	
}
