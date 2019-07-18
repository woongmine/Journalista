package kr.co.journalista.member;

public interface MemberDAO {

	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public MemberVO idCheck(String userId) throws Exception;
}
