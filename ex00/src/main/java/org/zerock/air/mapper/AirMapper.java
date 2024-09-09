package org.zerock.air.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.air.vo.AirVO;

import com.webjjang.util.page.PageObject;


@Repository
public interface AirMapper {
	
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
	public List<AirVO> getAirport(@Param("countryCode") String countryCode);
	
	// 제조사별 비행기 리스트 가져오기
	public List<AirVO> getAirplane(@Param("airplanePdt") String airplanePdt);
	
	// 항공사 기종 리스트
	public List<AirVO> flightList(@Param("pageObject") PageObject pageObject, @Param("airlineNo") Long airlineNo);
	
	// 전체 데이터 개수 가져오기
	public Long getTotalRow(@Param("pageObject") PageObject pageObject, @Param("airlineNo") Long airlineNo);
	
	// 관리자 - 항공편 상세보기
	public AirVO getFlightInfo(@Param("flightName") String flightName);
	
	// 항공 노선 리스트
	public List<AirVO> routeList(@Param("pageObject") PageObject pageObject, @Param("airlineNo") Long airlineNo, @Param("routeId") Long routeId);
	
	// 전체 데이터 개수 가져오기
	public Long getRouteTotalRow(@Param("pageObject") PageObject pageObject, @Param("airlineNo") Long airlineNo);
	
	// 전체 데이터 개수 가져오기
	public AirVO getPrice(@Param("airlineNo") Long airlineNo, @Param("routeId") Long routeId);
	
	// 노선별 스케줄 리스트
	public List<AirVO> airScheduleDetail(@Param("airlineNo") Long airlingeNo, @Param("routeId") Long routeId, @Param("pageObject") PageObject pageObject);

}
