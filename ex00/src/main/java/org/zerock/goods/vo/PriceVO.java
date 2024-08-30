package org.zerock.goods.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PriceVO {

	private Long price_no;
	private Long goods_no;
	private Integer price;
	private Integer discount;
	private Integer discount_rate;
	private Integer delivery_charge;
	private Integer saved_rate;
	private Date sale_startDate;
	private Date sale_endDate;

}
