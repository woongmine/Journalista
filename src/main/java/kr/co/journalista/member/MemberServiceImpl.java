package kr.co.journalista.member;

import java.io.PrintWriter;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.co.journalista.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	// 아이디중복체크
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		return dao.idCheck(userId);
	}

	//회원정보 수정
	@Override
	public void mypage_update(MemberVO vo) throws Exception {
		dao.mypage_update(vo);
	}
	//마이페이지에서 회원탈퇴 vo에 지금 date날짜 넣고 db에 vo sql쿼리 실행하는 dao실행
	@Override
	public void mypage_withdrawal(MemberVO vo, HttpSession session) throws Exception {
		Date date = new Date();
		vo.setWithdrawal_date(date);
		dao.mypage_withdrawal(vo);		
	}
}
