package org.zerock.goods.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.goods.mapper.GoodsMapper;
import org.zerock.goods.vo.ColorVO;
import org.zerock.goods.vo.GoodsVO;
import org.zerock.goods.vo.SizeVO;

import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

//자동 생성을 위한 어노테이션
//- @Controller - url : HTML, @Service - 처리, @Repository - 데이터 저장, 
//@Component - 구성체, @RestController - url : data : ajax, @~Advice - 예외 처리
@Service
@Log4j
// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
@Qualifier("goodsServiceImpl")
public class GoodsServiceImpl implements GoodsService{

	// 자동 DI 적용 - @Setter, @Autowired, @Inject
	@Inject
	private GoodsMapper mapper;
	
	// 상품 리스트
	@Override
	public List<GoodsVO> list(PageObject pageObject) {
		log.info("list() 실행");
		// 전체 데이터 개수 구하기
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	// 상품 글보기
	@Override
	@Transactional
	public GoodsVO view(Long no, int inc) {
		log.info("view() 실행");
		if(inc == 1) mapper.increase(no);
		return mapper.view(no);
	}
	
	// 상품 글등록
	@Override
	// @Transactional - insert 2번이 성공을 해야 commit 한다. 한개라도 오류가 나면 rollback.
	// 상품, 가격, 이미지, 사이즈컬러, 옵션 -> 등록하다가 하나라고 오류가 나면 다 rollback 시킨다.
	@Transactional
	public Integer write(GoodsVO vo) {
		Integer result = mapper.write(vo); // 글번호를 시퀀스에서 새로운 번호 사용
		// log.info(vo);
		// vo.setNo(10000L);
		// mapper.writeTx(vo); // 위에서 사용한 글번호 재사용 - PK 예외 발생
		return result;
	}
	
	// 상품 글수정
	@Override
	public Integer update(GoodsVO vo) {
		return mapper.update(vo);
	}
	
	// 상품 글삭제
	@Override
	public Integer delete(GoodsVO vo) {
		return mapper.delete(vo);
	}
	
	// 상품 사이즈 가져오기
	@Override
	public List<SizeVO> getSize(Integer cate_code1) {
		return mapper.getSize(cate_code1);
	}
	
	// 상품 색상 가져오기
	@Override
	public List<ColorVO> getColor(Integer cate_code1) {
		return mapper.getColor(cate_code1);
	}
	
	// 삭제할 제품에 대한 이미지를 전부 가져오기 : 상품 이미지 가져오기 -> DB 상품 삭제 -> 이미지 삭제 
	
}
