package org.zerock.goods.vo;

import java.net.URLEncoder;

import lombok.Data;

@Data
public class GoodsSearchVO {

	private Integer cate_code1; // 대분류 검색 - 상품 등록 내용 참고
	private Integer cate_code2; // 중분류 검색 - 상품 등록 내용 참고
	private String goods_name; // 상품 명에 포함되어 있는 문자 검색
	private Long min; // 제일 작은 금액 검색
	private Long max; // 제일 큰 금액 검색
	
	// 기본 생성자, getter & setter, toString() 등 외에 필요한 메서드는 추가로 사용
	// 상품 검색 - url 뒤에 위에 5개의 데이터를 붙혀서 리턴하는 메서드 작성
	public String getQuery() throws Exception {
		return "cate_code1=" + toStr(cate_code1) + "&cate_code2=" + toStr(cate_code2) 
				+ "&goods_name=" + URLEncoder.encode(toStr(goods_name), "utf-8")
				+ "&min=" + toStr(min) + "&max=" + toStr(max);
	}
	
	// null로 표기되는 것을 방지하기 위한 메서드
	private String toStr(Object obj) throws Exception {
		
		// 한글 처리
		return (obj == null) ? "" : obj.toString() ;
	}
	
	// 검색 데이터가 존재하는지 확인하는 메서드
	// return type이 boolean 타입은 메서드 앞에 is를 붙히고 메서드를 사용할 때는 is를 빼고 사용
	public Boolean isExist() {
		
		// 검색 내용이 아무것도 없으면 false 를 반환
		if(!(cate_code1 == null || cate_code1 == 0)) return true;
		if(!(goods_name == null || goods_name == "")) return true;
		if(!(min == null || min == 0)) return true;
		if(!(max == null || max == 0)) return true;
		
		return false;		
	}
	
	
}
