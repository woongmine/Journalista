package kr.co.journalista.member;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.journalista.LoginDTO;
import kr.co.journalista.MemberVO;

public interface MemberService {

	// 로그인
	public MemberVO login(LoginDTO dto) throws Exception;

	// 아이디중복체크
	public MemberVO idCheck(String userId) throws Exception;

	// 자동로그인 로그인 유지
	public void keepLogin(String email, String sessionId, Date next) throws Exception;

	// 로그인 세션키
	public MemberVO checkUserWithSessionKey(String value);

	// 회원정보수정
	public void mypage_update(MemberVO vo) throws Exception;

	// 회원탈퇴
	public void mypage_withdrawal(MemberVO vo, HttpSession session) throws Exception;
	
	// 비밀번호 암호화 체크를 위해 암호화된 비밀번호 받아오기
	public String passCheck(String email) throws Exception;
}
