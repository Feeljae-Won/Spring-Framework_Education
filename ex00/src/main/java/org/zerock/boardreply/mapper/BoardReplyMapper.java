package org.zerock.boardreply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.boardreply.vo.BoardReplyVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface BoardReplyMapper {
	
	// 댓글 리스트
	// 메서드의 처리되는 데이터는 기본이 1개. 2개 이상의 경우 @Param 을 사용. -> map 으로 만들어서 한개를 넘긴다.
	public List<BoardReplyVO> list(@Param("pageObject") PageObject pageObject, @Param("no") Long no);
	// 댓글 페이지 처리를 위한 전체 데이트 개수
	public Long getTotalRow(@Param("pageObject") PageObject pageObject, @Param("no") Long no);
	
	// 댓글 등록
	public Integer write(BoardReplyVO vo);
	
	// 댓글 수정
	public Integer update(BoardReplyVO vo);
	
	// 댓글 삭제
	public Integer delete(BoardReplyVO vo);

}
