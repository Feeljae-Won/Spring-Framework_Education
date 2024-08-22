package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// test에 사용되는 클래스
@RunWith(SpringJUnit4ClassRunner.class)
// 설정파일 지정
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTests {
	
	// 자동 DI - root-context.xml에 bean 태그로 설정
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	
	// 자동 DI - root-context.xml에 bean 태그로 설정
	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnection() {
		log.info("--------------------------[ CP Test ]---------------------------");
		
		// try(resouce) -> try 가 종료되면 resource가 자동 닫기가 된다.
		try (Connection con = dataSource.getConnection()) {
			log.info(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			fail(e.getMessage());
		} // end of try~catch
	} // end of testConnection()
	
	@Test
	public void testMyBatis() {
		log.info("--------------------------[ myBatis Test ]---------------------------");
		
		// try(resouce) -> try 가 종료되면 resource가 자동 닫기가 된다.
		try (SqlSession session = sqlSessionFactory.openSession();
				Connection con = session.getConnection()) {
			log.info(session);
			log.info(con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			fail(e.getMessage());
		} // end of try~catch
	} // end of testConnection()

}
