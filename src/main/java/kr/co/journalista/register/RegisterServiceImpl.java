package kr.co.journalista.register;

import java.io.PrintWriter;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.journalista.MemberVO;

@Service
public class RegisterServiceImpl  implements RegisterService{
	String totemail;
	
	@Inject
	RegisterDAO dao;
	
	@Inject
	private JavaMailSender mailSender;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;


	@Transactional
	@Override
	public void register(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception {
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		if(vo.getEmail() == "" || vo.getName() == "" || vo.getPassword() == "" || vo.getPasswordCheck() == "") {
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("name", vo.getName());
			session.setAttribute("password", vo.getPassword());
			session.setAttribute("passwordCheck", vo.getPasswordCheck());
			writer.write("<script> alert(\"모든 빈칸을 채워주셔야 합니다.\"); location.href='register';</script>");
		}
		else if(!vo.getPassword().equals(vo.getPasswordCheck())) {
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("name", vo.getName());
			session.setAttribute("password", "");
			session.setAttribute("passwordCheck", "");
			writer.write("<script> alert(\"비밀번호를 확인해주세요.\"); location.href='register';</script>");
		}
		else if(vo.getPassword().length() < 8) {
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("name", vo.getName());
			session.setAttribute("password", "");
			session.setAttribute("passwordCheck", "");
			writer.write("<script> alert(\"비밀번호는 8자 이상이어야 합니다.\"); location.href='register';</script>");
		}
		else {
			Date date = new Date();
			vo.setReg_date(date);
			System.out.println(totemail);
			if(totemail.equals(vo.getEmail())) {
				System.out.println("!!!!!!!!!!!"+vo);
				int cnt = dao.emailCheck(vo.getEmail());
				
				if(cnt == 1) {
					writer.write("<script> alert(\"이메일 중복확인을 해주세요.\"); location.href='register';</script>");
					session.setAttribute("email", vo.getEmail());
					session.setAttribute("name", vo.getName());
					session.setAttribute("password", vo.getPassword());
					session.setAttribute("passwordCheck", vo.getPasswordCheck());
				}
				else {
					String password = vo.getPassword();
					
					
					String encryptPassword = passwordEncoder.encode(password);
					vo.setPassword(encryptPassword);
				
					System.out.println("암호화된 비밀번호는======="+encryptPassword);
					
					
					dao.register(vo); // 회원가입 DAO

					String key = new TempKey().getKey(50, false); // 인증키 생성
					
					dao.createAuthKey(vo.getEmail_key(), key); // 인증키 DB저장
				
					MailHandler sendMail = new MailHandler(mailSender);
					sendMail.setSubject("[Journalista 서비스 이메일 인증]");
					sendMail.setText(
							new StringBuffer().append("<h1> 저널리스트 메일인증 </h1>").append("<a href='http://localhost:8081/member/emailConfirm?email=").append(vo.getEmail()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
					sendMail.setFrom("Journalista", "저널리스타");
					sendMail.setTo(vo.getEmail());
					sendMail.send();
				}
			
				session.invalidate();
				writer.write("<script> alert(\"회원가입 완료. 이메일 인증을 해주세요.\"); location.href='/';</script>");
			}
			else {
				session.setAttribute("email", vo.getEmail());
				session.setAttribute("name", vo.getName());
				session.setAttribute("password", vo.getPassword());
				session.setAttribute("passwordCheck", vo.getPasswordCheck());
				writer.write("<script> alert(\"이메일 중복확인을 다시 해주세요.\"); location.href='register';</script>");
			}
		}
	}

	@Override
	public int emailCheck(String email) throws Exception {
		int emailCnt = dao.emailCheck(email);
		totemail = email;
		return emailCnt;
	}
	
//	@Transactional
//	@Override
//	public void create(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception {
//		PrintWriter writer = response.getWriter();
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("text/html; utf-8");
//		
//	}

	@Override
	public void userAuth(String email_key) throws Exception {
		dao.userAuth(email_key);
	}
}
