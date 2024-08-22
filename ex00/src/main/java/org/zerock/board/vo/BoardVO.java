package org.zerock.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long no;
	private String title;
	private String content;
	private String writer;
	// sql java.sql.date : 캐스팅 - spring 에서는 자동 캐스팅, 계산하는데 용이
	private Date writeDate; 
	private Long hit;
	private String pw;

}
