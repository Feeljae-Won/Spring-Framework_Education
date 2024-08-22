package org.zerock.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoDTO {
	
	// yyyy-mm-dd -> 사용자가 입력한 날짜를 java로 가져올 때 패턴을 지정하지 않으면 오류가 난다.
	// pattern -> java SimpleDateFormat 클래스 참조
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	
	

}
