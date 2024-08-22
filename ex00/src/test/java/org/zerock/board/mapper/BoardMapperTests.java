package org.zerock.board.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.board.vo.BoardVO;

import com.webjjang.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// mapper 메서드 동작 테스트(단위 테스트)
// test에 사용되는 클래스
@RunWith(SpringJUnit4ClassRunner.class)
// 설정파일 지정
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	// lombok의 setter를 이용해서 Spring Autowired 이용한 자동 DI(의존성) 적용.
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	// list() Test
	@Test
	public void testList() {
		
		log.info("[일반 게시판 리스트(list()) Test] ----------------------------------------------");
		
		// 필요한 데이터(파라미터로 넘겨지는 데이터)는 하드코딩 한다.
		// pageObject 생성
		PageObject pageObject = new PageObject();
		log.info(mapper.list(pageObject));
		
	}
	
	// getTotalRow() Test
	@Test
	public void testGetTotalRow() {
		
		log.info("[일반 게시판 getTotalRow() Test] ----------------------------------------------");
		
		// 필요한 데이터(파라미터로 넘겨지는 데이터)는 하드코딩 한다.
		// pageObject 생성
		PageObject pageObject = new PageObject();
		log.info(mapper.getTotalRow(pageObject));
		
	}
	
	// increase() Test
	@Test
	public void testIncrease() {
		
		log.info("[일반 게시판 increase() Test] ----------------------------------------------");
		
		// 필요한 데이터(파라미터로 넘겨지는 데이터)는 하드코딩 한다.
		Long no = 847L;
		
		log.info(mapper.increase(no));
		
	}
	
	// view() Test
	@Test
	public void testView() {
		
		log.info("[일반 게시판 view() Test] ----------------------------------------------");
		
		// 필요한 데이터(파라미터로 넘겨지는 데이터)는 하드코딩 한다.
		Long no = 847L;
		
		log.info(mapper.view(no));
		
	}

}
