package org.zerock.goods.service;

import java.util.List;

import org.zerock.goods.vo.GoodsVO;
import com.webjjang.util.page.PageObject;

public interface GoodsService {

	// 상품 리스트
	public List<GoodsVO> list(PageObject pageObject);
	
	// 상품 보기
	public GoodsVO view(Long no, int inc);
	
	// 상품 등록
	public Integer write(GoodsVO vo);
	
	// 상품 수정 - 텍스트 정보 + 대표 이미지 + 상세 설명 이미지
	public Integer update(GoodsVO vo);
	
	// 상품 삭제
	public Integer delete(GoodsVO vo);
	
	// 상품 이미지 추가
	// 상품 이미지 변경
	// 상품 이미지 제거
	
	// 상품 사이즈컬러 추가
	// 상품 사이즈컬러 변경
	// 상품 사이즈컬러 제거
	
	// 상품 현재 가격 변경 + 기간 변경
	// 상품 예정 가격 추가
	
}
