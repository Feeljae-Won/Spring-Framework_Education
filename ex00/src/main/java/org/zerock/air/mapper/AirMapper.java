package org.zerock.air.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.air.vo.AirVO;


@Repository
public interface AirMapper {
	
	// 일반 게시판 리스트
	public List<AirVO> searchList(String searchAirport);
	

}
