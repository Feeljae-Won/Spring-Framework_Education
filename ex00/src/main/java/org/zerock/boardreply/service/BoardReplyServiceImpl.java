package org.zerock.boardreply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.boardreply.mapper.BoardReplyMapper;
import org.zerock.boardreply.vo.BoardReplyVO;

import com.webjjang.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// 자동 생성 - @Controller, @RestController, @Service, @Repository, @Component(구성), @~Advice(예외처리)
@Service
@Qualifier("BoardReplyServiceImpl")
@Log4j
public class BoardReplyServiceImpl implements BoardReplyService {
	
	// 자동 DI
	@Setter(onMethod_= @Autowired)
	private BoardReplyMapper mapper;

	@Override
	public List<BoardReplyVO> list(PageObject pageObject, Long no) {
		
		log.info(no);
		
		// 전체 데이터 세팅
		pageObject.setTotalRow(mapper.getTotalRow(pageObject, no)); // 페이지 처리를 위해서 반드시 필요
		
		return mapper.list(pageObject, no);
	}

	@Override
	public Integer write(BoardReplyVO vo) {
		
		return mapper.write(vo);
	}

	@Override
	public Integer update(BoardReplyVO vo) {

		return mapper.update(vo);
	}

	@Override
	public Integer delete(BoardReplyVO vo) {

		return mapper.delete(vo);
	}

}
