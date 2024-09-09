package org.zerock.goods.service;

import java.util.List;

import org.zerock.goods.vo.ColorVO;
import org.zerock.goods.vo.GoodsImageVO;
import org.zerock.goods.vo.GoodsOptionVO;
import org.zerock.goods.vo.GoodsSearchVO;
import org.zerock.goods.vo.GoodsSizeColorVO;
import org.zerock.goods.vo.GoodsVO;
import org.zerock.goods.vo.SizeVO;

import com.webjjang.util.page.PageObject;

public interface GoodsService {

	// 상품 리스트
	public List<GoodsVO> list(PageObject pageObject, GoodsSearchVO searchVO);
	
	// 상품 보기 ----------------------------------------
	public GoodsVO view(Long no, int inc);
	
	// 상세보기 이미지 리스트 받아오기
	public List<GoodsImageVO> viewImageList(Long good_no);
	
	// 상세보기 사이즈 가져오기
	public List<GoodsSizeColorVO> sizeColorList(Long goods_no);
	
	// 상세보기 옵션 가져오기
	public List<GoodsOptionVO> optionList(Long goods_no);
	
	// 상세보기 끝 --------------------------------------
	
	// 상품 등록
	public Integer write(GoodsVO vo, 
			List<GoodsImageVO> goodsImageList, List<GoodsSizeColorVO> goodsSizeColorList, List<GoodsOptionVO> goodsOptionList);
	
	// 상품 수정 - 텍스트 정보 + 대표 이미지 + 상세 설명 이미지
	public Integer update(GoodsVO vo);
	
	// 상품 삭제
	public Integer delete(GoodsVO vo);
	
	// 상품 사이즈 가져오기
	public List<SizeVO> getSize(Integer cate_code1);
	
	// 상품 색상 가져오기
	public List<ColorVO> getColor(Integer cate_code1);


	
	// 상품 이미지 추가
	// 상품 이미지 변경
	// 상품 이미지 제거
	
	// 상품 사이즈컬러 추가
	// 상품 사이즈컬러 변경
	// 상품 사이즈컬러 제거
	
	// 상품 현재 가격 변경 + 기간 변경
	// 상품 예정 가격 추가
	
	
}
