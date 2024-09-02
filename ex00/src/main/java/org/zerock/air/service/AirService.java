package org.zerock.air.service;

import java.util.List;

import org.zerock.air.vo.AirVO;

public interface AirService {

	// 공항 검색 리스트
	public List<AirVO> searchList(String searchAirport);
	
	// 항공권 검색 리스트
	public List<AirVO> searchResult(AirVO vo);
	
	// 대륙별 국가 리스트
	public List<AirVO> nocList(String pan);
	

	
}
