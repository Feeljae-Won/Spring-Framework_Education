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
	
	// 국가 등록
	public Integer nocWrite(AirVO vo);
	
	// 국가 수정
	public Integer nocUpdate(AirVO vo);
	
	// 국가 삭제
	public Integer nocDelete(AirVO vo);
	
}
