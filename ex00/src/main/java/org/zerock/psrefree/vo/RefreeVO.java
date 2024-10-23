package org.zerock.psrefree.vo;

import java.util.List;

import lombok.Data;

@Data
public class RefreeVO {

	private Long rnum;
	private Long no;
	private String name;
	private String locate;
	private Long court;
	private Long courtNo;
	
	private List<RefreeVO> list;
	
}
