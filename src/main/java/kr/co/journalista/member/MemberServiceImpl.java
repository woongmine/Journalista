package kr.co.journalista.member;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.journalista.LoginDTO;
import kr.co.journalista.MemberVO;
import kr.co.journalista.register.MailHandler;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;


	// 로그인
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	// 아이디중복체크
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		return dao.idCheck(userId);
	}

	// 자동로그인 로그인유지
	public void keepLogin(String email, String sessionId, Date next) throws Exception {
		dao.keepLogin(email, sessionId, next);
	}

	// 세션키
	public MemberVO checkUserWithSessionKey(String value) {
		return dao.checkUserWithSessionKey(value);
	}

	// 회원정보 수정
	@Override
	public void mypage_update(MemberVO vo) throws Exception {
		dao.mypage_update(vo);
	}

	// 마이페이지에서 회원탈퇴 vo에 지금 date날짜 넣고 db에 vo sql쿼리 실행하는 dao실행
	@Override
	public void mypage_withdrawal(MemberVO vo, HttpSession session) throws Exception {
		Date date = new Date();
		vo.setWithdrawal_date(date);
		dao.mypage_withdrawal(vo);
	}
	
	// 비밀번호 암호화 체크를 위해 암호화된 비밀번호 받아오기
	@Override
	public String passCheck(String email) throws Exception {
		return dao.passCheck(email);
	}
	
	//비밀번호 발급
	@Override
	public void update_pw(MemberVO vo) throws Exception {
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Journalista 임시비밀번호 발급]");
		sendMail.setText(
				new StringBuffer().append("<h1> 저널리스트 임시비밀번호 입니다. </h1>").append("이메일은 :  "+vo.getEmail()+"<br>").append("임시비밀번호는  : "+vo.getPassword()).toString());
		sendMail.setFrom("Journalista", "저널리스타");
		sendMail.setTo(vo.getEmail());
		sendMail.send();
		String spassword = vo.getPassword();					
		String encryptPassword = passwordEncoder.encode(spassword);	
		vo.setPassword(encryptPassword);
		dao.update_pw(vo);
		
	}
	
}
