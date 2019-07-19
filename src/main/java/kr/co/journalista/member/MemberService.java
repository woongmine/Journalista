package kr.co.journalista.member;

import kr.co.journalista.MemberVO;
public interface MemberService {


	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 아이디중복체크
	public MemberVO idCheck(String userId) throws Exception;
	
	//회원정보수정
	public void mypage_update(MemberVO vo) throws Exception;

}
