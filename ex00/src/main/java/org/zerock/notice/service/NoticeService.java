package org.zerock.notice.service;

import java.util.List;

import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.page.PageObject;

public interface NoticeService {

	// 공지사항 게시판 리스트
	public List<NoticeVO> list(PageObject pageObject);
	
	// 공지사항 게시판 글보기
	public NoticeVO view(Long no);
	
	// 공지사항 게시판 글등록
	public Integer write(NoticeVO vo);
	
	// 공지사항 게시판 글수정
	public Integer update(NoticeVO vo);

	// 공지사항 게시판 글수정
	public Integer delete(NoticeVO vo);
	
}
