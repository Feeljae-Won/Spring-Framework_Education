package org.zerock.goods.vo;

import lombok.Data;

@Data
public class PriceVO {

	private Long price_no;
	private Long goods_no;
	private Integer price;
	private Integer discount;
}
