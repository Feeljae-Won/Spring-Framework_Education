package org.zerock.air.service;

import java.util.List;

import org.zerock.air.vo.AirVO;
import com.webjjang.util.page.PageObject;

public interface AirService {

	// 일반 게시판 리스트
	public List<AirVO> list(PageObject pageObject, String searchAirport);
	

	
}
