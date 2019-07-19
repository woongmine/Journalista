package kr.co.journalista.member;

import kr.co.journalista.MemberVO;
public interface MemberService {

	// 회원가입
	public void register(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 아이디중복체크
	public MemberVO idCheck(String userId) throws Exception;

}
