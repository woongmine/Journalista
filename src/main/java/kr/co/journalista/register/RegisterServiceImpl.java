package kr.co.journalista.register;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.journalista.MemberVO;

@Service
public class RegisterServiceImpl  implements RegisterService{
	
	@Inject
	RegisterDAO dao;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public int emailCheck(String email) throws Exception {
		int emailCnt = dao.emailCheck(email);
		return emailCnt;
	}
	
	@Transactional
	@Override
	public void create(MemberVO vo) throws Exception {
	dao.register(vo); // 회원가입 DAO

	String key = new TempKey().getKey(50, false); // 인증키 생성

	dao.createAuthKey(vo.getEmail_key(), key); // 인증키 DB저장

	MailHandler sendMail = new MailHandler(mailSender);
	sendMail.setSubject("[Journalista 서비스 이메일 인증]");
	sendMail.setText(
			new StringBuffer().append("<h1> 저널리스트 메일인증 </h1>").append("<a href='http://localhost:8085/member/emailConfirm?email=").append(vo.getEmail()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
	sendMail.setFrom("Journalista", "저널리스타");
	sendMail.setTo(vo.getEmail());
	sendMail.send();
	}

	@Override
	public void userAuth(String email_key) throws Exception {
		dao.userAuth(email_key);
	}
}
