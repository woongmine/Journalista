package kr.co.journalista.register;

import kr.co.journalista.MemberVO;

public interface RegisterService {

	public void register(MemberVO vo) throws Exception;
	
	public int emailCheck(String email) throws Exception;

	public void create(MemberVO vo) throws Exception;
	
	public void userAuth(String userEmail) throws Exception;
}
