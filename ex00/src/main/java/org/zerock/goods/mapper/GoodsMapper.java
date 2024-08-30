package org.zerock.goods.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.goods.vo.GoodsVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface GoodsMapper {

	//상품 리스트
	public List<GoodsVO> list(PageObject pageObject);
	
	// 상품 리스트 페이지 처리를 위한 전체 데이터 개수
	public Long getTotalRow(PageObject pageObject);
	
	// 보기 조회수 1 증가
	public Integer increase(Long no);
	
	// 보기
	public GoodsVO view(Long no);

	// 등록
	public Integer write(GoodsVO vo);
	// 글등록 트랜젝션 처리 테스트
	// public Integer writeTx(GoossVO vo);
	
	// 수정
	public Integer update(GoodsVO vo);
	
	// 삭제
	public Integer delete(GoodsVO vo);
	
}
