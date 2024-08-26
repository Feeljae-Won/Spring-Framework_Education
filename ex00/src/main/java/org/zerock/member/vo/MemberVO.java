package org.zerock.member.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String gender;
	private Date birth;
	private String email;
	private String tel;
	private Date regDate; // 회원 가입일
	private Date conDate; // 최근 접속일
	private String status;
	private String photo;
	private String newMsgCnt;
	private Long gradeNo;
	private String gradeName;
}
