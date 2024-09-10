package org.zerock.cart.vo;

import java.util.List;

import lombok.Data;

@Data
public class CartVO {

	private Long cart_no; // seq 사용 - cycle 순환 처리 : 최대 숫자가 되면 다시 1로 세팅하낟.
	private Long goods_no;
	private String goods_name;
	private Long size_no;
	private String size_name;
	private Long color_no;
	private String color_name;
	private Long goods_option_no;
	private String option_name;
	private int count; // 수량

	// 여러개의 객체(vo) 데이터를 한꺼번에 받으려면 DispatcherServlet의 List로 만들어서 넘겨 준다. 그래서 필요하다.
	// Countroller
	private List<CartVO> list; // jsp 에서 여러개 데이터를 받기 위해 생성
	
}
