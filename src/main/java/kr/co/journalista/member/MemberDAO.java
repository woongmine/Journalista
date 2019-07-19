package kr.co.journalista.member;

import kr.co.journalista.MemberVO;
public interface MemberDAO {

	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public MemberVO idCheck(String userId) throws Exception;
}
