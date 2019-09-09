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
	public MemberVO checkUserWithSessionKey(String sessionId) throws Exception {
		return dao.checkUserWithSessionKey(sessionId);
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
				new StringBuffer()
				.append("<table class=\"__se_tbl\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" style=\"background-color: rgb(199, 199, 199);\"><tbody><tr><td style=\"padding: 3px 4px 2px; background-color: rgb(255, 255, 255); color: rgb(102, 102, 102); width: 853px; height: 282px;\"><p>&nbsp;</p><h2 style=\"margin: 0px 0px 1em; padding: 0px; font-style: inherit; font-variant: inherit; box-sizing: inherit; line-height: 1.65; font-size: 1.1em; border: 0px; font-stretch: inherit; font-family: Raleway, Helvetica, sans-serif; vertical-align: baseline; color: rgb(60, 59, 59); letter-spacing: 0.25em; text-transform: uppercase; text-align: center;\"><span style=\"font-size: 14pt; color: rgb(37, 37, 37);\">JOURNALISTA 임시 비밀번호 발급</span></h2><h2 style=\"margin: 0px 0px 1em; padding: 0px; font-style: inherit; font-variant: inherit; box-sizing: inherit; line-height: 1.65; font-size: 1.1em; border: 0px; font-stretch: inherit; font-family: Raleway, Helvetica, sans-serif; vertical-align: baseline; color: rgb(60, 59, 59); letter-spacing: 0.25em; text-transform: uppercase; text-align: center;\"><div style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 18.6667px; line-height: inherit; font-family: Source Sans Pro; vertical-align: baseline; color: rgb(100, 100, 100); letter-spacing: normal; text-align: left; text-transform: none;\"></div><div style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18.6667px; line-height: inherit; font-family: Source Sans Pro; vertical-align: baseline; color: rgb(100, 100, 100); letter-spacing: normal; text-transform: none;\"><p style=\"font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin-bottom: 2em; box-sizing: inherit; border: 0px; vertical-align: baseline; color: rgb(170, 170, 170);\"><span style=\"font-weight: inherit;\">임시 비밀번호는 ")
				.append("</span><span style=\"color: rgb(0, 0, 0);\"><u>"+vo.getPassword()+"</u></span><span style=\"font-weight: inherit;\">입니다.</span></p></div></h2></td></tr></tbody>\r\n" + 
						"</table>")
				.toString());
		sendMail.setFrom("Journalista", "저널리스타");
		sendMail.setTo(vo.getEmail());
		sendMail.send();
		String spassword = vo.getPassword();
		String encryptPassword = passwordEncoder.encode(spassword);	
		vo.setPassword(encryptPassword);
		dao.update_pw(vo);
		
	}
	
}
