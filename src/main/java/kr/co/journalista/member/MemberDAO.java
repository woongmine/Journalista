package kr.co.journalista.member;

import java.util.Date;

import kr.co.journalista.LoginDTO;
import kr.co.journalista.MemberVO;

public interface MemberDAO {

	// 로그인(자동로그인을 위해 DTO로 받는다.)
	public MemberVO login(LoginDTO dto) throws Exception;

	// 로그인 체큰
	public MemberVO idCheck(String userId) throws Exception;

	// 자동로그인 로그인유지
	public void keepLogin(String email, String sessionId, Date next) throws Exception;

	// 자동로그인 세션키
	public MemberVO checkUserWithSessionKey(String value);

	// 회원정보 수정
	public int mypage_update(MemberVO vo) throws Exception;

	// 회원탈퇴
	public void mypage_withdrawal(MemberVO vo) throws Exception;

	// 비밀번호 암호화 체크를 위해 암호화된 비밀번호 받아오기
	public String passCheck(String email) throws Exception;

	// 비밀번호 변경
	public void update_pw(MemberVO vo) throws Exception;
}
