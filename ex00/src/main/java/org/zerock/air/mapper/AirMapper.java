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
	

}
