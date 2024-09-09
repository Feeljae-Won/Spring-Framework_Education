package org.zerock.air.service;

import java.util.List;

import org.zerock.air.vo.AirVO;

import com.webjjang.util.page.PageObject;

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
	
	// 국가별 공항 리스트 가져오기
	public List<AirVO> getAirport(String countryCode);
	
	// 제조사별 비행기 모델 리스트 가져오기
	public List<AirVO> getAirplane(String airplanePdt);
	
	// 관리자 - 항공사 기종 리스트
	public List<AirVO> flightList(PageObject pageObject, Long airlineNo);
	
	// 관리자 기종 상세보기
	public AirVO getFlightInfo(String flightName);
	
	// 항공 노선 리스트
	public List<AirVO> routeList(PageObject pageObject, Long airlineNo, Long routeId);
	
	// 항공 노선에 따른 금액 가져오기
	public AirVO getPrice(Long airlineNo, Long routeId);

	// 노선별 운항 스케줄 리스트
	public List<AirVO> airScheduleDetail(Long airlingeNo, Long routeId, PageObject pageObject);
}
