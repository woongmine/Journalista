package co.kr.woong.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.journalista.MemberVO;
import kr.co.journalista.board.BoardService;
import kr.co.journalista.board.BoardVO;
import kr.co.journalista.register.RegisterService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DBConnection {

	final String DRIVER = "org.mariadb.jdbc.Driver";
	final String URL = "jdbc:mariadb://14.55.249.14:3307";
	final String USER = "airfly";
	final String PASSWORD = "12345";

	@Test
	public void connectionTest() throws Exception {

		Class.forName(DRIVER);

		try {
			Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
	} // connectionTest end
//	
//	@Inject
//	private RegisterService service;
//	
//	@Test
//	public void writeTest() throws Exception{
//		MemberVO vo = new MemberVO();
//		
//		vo.setEmail("이메일 테스트");
//		vo.setName("이름 테스트");
//		vo.setPassword("비번 테스트");
//		
//		service.register(vo);
//		
//	}
	
}
