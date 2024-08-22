package org.zerock.boardreply.service;

import java.util.List;

import org.zerock.boardreply.vo.BoardReplyVO;

import com.webjjang.util.page.PageObject;

public interface BoardReplyService {
	
	// 댓글 리스트
	public List<BoardReplyVO> list(PageObject pageObject, Long no);
	
	// 댓글 등록
	public Integer write(BoardReplyVO vo);
	
	// 댓글 수정
	public Integer update(BoardReplyVO vo);
	
	// 댓글 삭제
	public Integer delete(BoardReplyVO vo);

}
