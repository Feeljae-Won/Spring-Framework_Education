package org.zerock.notice.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.notice.vo.NoticeVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface NoticeMapper {
	
	// 공지사항 게시판 리스트
	public List<NoticeVO> list(PageObject pageObject);
	// 공지사항 게시판 리스트 페이지 처리를 위한 전체 데이터 개수
	public Long getTotalRow(PageObject pageObject);
	
	// 공지사항 게시판 상세보기
	public NoticeVO view(Long no);
	
	// 공지사항 게시판 글 등록
	public Integer write(NoticeVO vo);
	
	// 공지사항 게시판 글 수정
	public Integer update(NoticeVO vo);
	
	// 공지사항 게시판 글 삭제
	public Integer delete(NoticeVO vo);

}
