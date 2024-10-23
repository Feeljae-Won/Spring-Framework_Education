package org.zerock.psrefree.service;

import java.util.List;

import org.zerock.psrefree.vo.RefreeVO;

public interface PSRefreeService {

	// 심판 등록
	public Integer write(RefreeVO list);
	
	// 심판 리스트
	public List<RefreeVO> list();
	
	// 심판 조 불러오기
	public List<RefreeVO> getCourtList(Long court);
	
}
