package org.zerock.member.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.member.vo.LoginVO;
import org.zerock.member.vo.MemberVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface MemberMapper {
	
	// 회원 관리 - 회원 리스트
	public List<MemberVO> list(PageObject pageObject);
	// 회원 관리 리스트 페이지 처리를 위한 전체 데이터 개수
	public Long getTotalRow(PageObject pageObject);
	
	// 회원 관리 - 회원 정보 상세보기
	public MemberVO view(Long no);
	
	// 회원 관리 글 보기 조회 수 1 증가
	public Integer increase(Long no);
	
	// 회원 관리 - 회원 등록
	public Integer write(MemberVO vo);
	
	// 회원 관리 - 회원 정보 수정
	public Integer update(MemberVO vo);
	
	// 회원 관리 - 회원 삭제
	public Integer delete(MemberVO vo);
	
	// 회원 관리 - 로그인 처리
	public LoginVO login(LoginVO vo);

}
