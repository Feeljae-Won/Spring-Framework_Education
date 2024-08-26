package org.zerock.air.service;

import java.util.List;

import org.zerock.board.vo.BoardVO;
import com.webjjang.util.page.PageObject;

public interface AirService {

	// 일반 게시판 리스트
	public List<BoardVO> list(PageObject pageObject);
	
	// 일반 게시판 글보기
	public BoardVO view(Long no, Long inc);
	
	// 일반 게시판 글등록
	public Integer write(BoardVO vo);
	
	// 일반 게시판 글수정
	public Integer update(BoardVO vo);

	// 일반 게시판 글수정
	public Integer delete(BoardVO vo);
	
}
