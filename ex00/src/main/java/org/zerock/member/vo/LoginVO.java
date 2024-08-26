package org.zerock.member.vo;

import lombok.Data;

@Data
public class LoginVO {
	private String id;
	private String pw;
	private String name;
	private String photo;
	private String newMsgCnt;
	private Long gradeNo;
	private String gradeName;
}
