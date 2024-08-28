package org.zerock.air.service;

import java.util.List;

import org.zerock.air.vo.AirVO;

public interface AirService {

	// 공항 검색 리스트
	public List<AirVO> searchList(String searchAirport);
	

	
}
