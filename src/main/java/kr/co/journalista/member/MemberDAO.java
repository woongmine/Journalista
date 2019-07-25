package kr.co.journalista.member;

import kr.co.journalista.MemberVO;
public interface MemberDAO {

	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public MemberVO idCheck(String userId) throws Exception;
	
	//회원정보 수정
	public int mypage_update(MemberVO vo) throws Exception;
	
	//회원탈퇴
	public void mypage_withdrawal(MemberVO vo) throws Exception;
}
