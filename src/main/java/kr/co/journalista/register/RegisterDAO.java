package kr.co.journalista.register;

import kr.co.journalista.MemberVO;

public interface RegisterDAO {

	public void register(MemberVO vo) throws Exception;
	
	public int emailCheck(String Email) throws Exception;
}
