package org.zerock.psrefree.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.psrefree.mapper.PSRefreeMapper;
import org.zerock.psrefree.vo.RefreeVO;


import lombok.extern.log4j.Log4j;

//자동 생성을 위한 어노테이션
//- @Controller - url : HTML, @Service - 처리, @Repository - 데이터 저장, 
//@Component - 구성체, @RestController - url : data : ajax, @~Advice - 예외 처리
@Service
@Log4j
// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
@Qualifier("PSRefreeServiceImpl")
public class PSRefreeServiceImpl implements PSRefreeService{

	// 자동 DI 적용 - @Setter, @Autowired, @Inject
	@Inject
	private PSRefreeMapper mapper;
	
	// 심판 등록
	public Integer write(RefreeVO list) {
		
		Integer result = 0;
		
		// 기존 리스트 확인
		if (mapper.list() != null || mapper.list().size() != 0) {
			
			// 기존 목록 지우기
			mapper.delete();
				
			for (RefreeVO vo : list.getList()) {
				mapper.write(vo);
				
				result = 1;
			}
	
			return result;
			
			
		} 
		
		return result;
		
	}
	
	// 회원 관리 리스트
	@Override
	public List<RefreeVO> list() {
		log.info("list() 실행");
		// 전체 데이터 개수 구하기
		return mapper.list();
	}

	// 심판 조 불러오기
	@Override
	public List<RefreeVO> getCourtList(Long court) {
		// TODO Auto-generated method stub
		return mapper.getCourtList(court);
	}
	
	
}
