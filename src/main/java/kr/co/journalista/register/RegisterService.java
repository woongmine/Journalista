package kr.co.journalista.register;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.journalista.MemberVO;

public interface RegisterService {

	public void register(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception;
	
	public int emailCheck(String email) throws Exception;

//	public void create(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception;
	
	public void userAuth(String userEmail) throws Exception;
}
