package org.zerock.goods.vo;

import lombok.Data;

@Data
public class GoodsSearchVO {

	
	private Integer cate_code1; // 대분류 검색 - 상품 등록 내용 참고
	private Integer cate_code2; // 중분류 검색 - 상품 등록 내용 참고
	private String goods_name; // 상품 명에 포함되어 있는 문자 검색
	private Long min; // 제일 작은 금액 검색
	private Long max; // 제일 큰 금액 검색
}
