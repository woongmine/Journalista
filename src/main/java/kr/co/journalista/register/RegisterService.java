package kr.co.journalista.register;

import kr.co.journalista.MemberVO;

public interface RegisterService {

	public void register(MemberVO vo) throws Exception;
}