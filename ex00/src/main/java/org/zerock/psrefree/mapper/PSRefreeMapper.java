package org.zerock.psrefree.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.psrefree.vo.RefreeVO;

@Repository
public interface PSRefreeMapper {
	
	// 심판 등록
	public Integer write(@Param("vo") RefreeVO vo);
	
	// 심판 목록 지우기
	public Integer delete();

	// 회원 관리 - 회원 리스트
	public List<RefreeVO> list();

	// 심판 조 리스트 불러오기
	public List<RefreeVO> getCourtList(Long court);

}
