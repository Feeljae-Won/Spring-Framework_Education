package org.zerock.goods.service;

import java.util.List;

import org.zerock.goods.vo.GoodsVO;
import com.webjjang.util.page.PageObject;

public interface GoodsService {

	// 상품관리 리스트
	public List<GoodsVO> list(PageObject pageObject);
	
	// 상품관리 글보기
	public GoodsVO view(Long no, Long inc);
	
	// 상품관리 글등록
	public Integer write(GoodsVO vo);
	
	// 상품관리 글수정
	public Integer update(GoodsVO vo);

	// 상품관리 글수정
	public Integer delete(GoodsVO vo);
	
	// 상품 이미지 추가
	// 상품 이미지 변경
	// 상품 이미지 제거
	
	// 상품 사이즈 컬러 추가
	// 상품 사이즈 컬러 변경
	// 상품 사이즈 컬러 제거
	
	// 상품 현재 가격 변경
	// 상품 예쩡 가격 추가
	
}
