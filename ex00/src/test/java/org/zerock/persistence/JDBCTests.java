package org.zerock.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	
	// JDBCTests 호출이 될 때 한번만 실행 - static 초기화 블록
	static {
		try {
			// 1. 드라이버 확인
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection () {
		Connection con = null;
		// 2. DB 연결
		try {
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", // driver 정보
					"java", // 계정 아이디
					"java"); // 계정 비밀번호
			log.info(con);
			log.info("2. 연결 성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(con!=null)
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
