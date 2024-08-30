package org.zerock.goods.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {
	
	private Long goods_no;
	private Integer cate_code1;
	private Integer cate_code2;
	private String goods_name;
	private String detail_image_name; // 상품 보기에서 나타날 대표 이미지
	private String content; // 상세 설명 텍스트
	private String company;
	private Date product_Date;
	private String image_name; // 리스트에 나타날 대표 이미지
	private Long hit;
	private Long price; // 현재 판매 가격
	private Long discount; // 현재 가격에 대한 할인가
	private Integer discount_rate; // 현재 가격에 대한 할인율
	private Long delivery_charge; // 배송료
	private Integer saved_rate; // 구매시 적립율
	private Date sale_startDate;
	private Date sale_endDate;

}
