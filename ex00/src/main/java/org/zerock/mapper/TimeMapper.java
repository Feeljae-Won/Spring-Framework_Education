package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

// DAO -> 자동 완성 처리된다.
@Repository
public interface TimeMapper {
	
	// select 쿼리
	@Select("SELECT sysdate from dual")
	public String getTime();
	
	// mapper.xml과 연결되어 있다.
	
	public String getTime2();
}
