package org.zerock.air.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.air.mapper.AirMapper;
import org.zerock.air.vo.AirVO;


import lombok.extern.log4j.Log4j;

//자동 생성을 위한 어노테이션
//- @Controller - url : HTML, @Service - 처리, @Repository - 데이터 저장, 
//@Component - 구성체, @RestController - url : data : ajax, @~Advice - 예외 처리
@Service
@Log4j
// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
@Qualifier("AirServiceImpl")
public class AirServiceImpl implements AirService{

	// 자동 DI 적용 - @Setter, @Autowired, @Inject
	@Inject
	private AirMapper mapper;
	
	// 공항 검색 리스트
	@Override
	public List<AirVO> searchList(String searchAirport) {
		log.info("list() 실행");
		// 전체 데이터 개수 구하기
		return mapper.searchList(searchAirport);
	}
	
	//항공권 검색 리스트
	public List<AirVO> searchResult(AirVO vo) {
		
		return mapper.searchResult(vo);
	}
	

}
