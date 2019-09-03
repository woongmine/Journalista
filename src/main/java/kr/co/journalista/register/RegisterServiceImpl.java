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
							new StringBuffer()
							.append("<table class=\"__se_tbl\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" _se2_tbl_template=\"1\" style=\"background-color: rgb(199, 199, 199);\"><tbody>\r\n" + 
									"<tr><td style=\"padding: 3px 4px 2px; background-color: rgb(255, 255, 255); color: rgb(102, 102, 102); width: 898px; height: 349px;\"><p style=\"text-align: center; \" align=\"center\">&nbsp;</p><div style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18.6667px; line-height: inherit; font-family: &quot;Source Sans Pro&quot;; vertical-align: baseline; color: rgb(100, 100, 100);\"><h2 style=\"box-sizing: inherit; margin: 0px 0px 1em; font-weight: 800; line-height: 1.65; font-size: 1.1em; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-family: Raleway, Helvetica, sans-serif; vertical-align: baseline; color: rgb(60, 59, 59); letter-spacing: 0.25em; text-transform: uppercase; text-align: center;\">JOURNALISTA 메일인증</h2><h2 style=\"box-sizing: inherit; margin: 0px 0px 1em; line-height: 1.65; font-size: 1.1em; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-family: Raleway, Helvetica, sans-serif; vertical-align: baseline; color: rgb(60, 59, 59); letter-spacing: 0.25em; text-transform: uppercase; text-align: center;\"><div style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 18.6667px; line-height: inherit; font-family: &quot;Source Sans Pro&quot;; vertical-align: baseline; color: rgb(100, 100, 100); letter-spacing: normal; text-align: left; text-transform: none;\"></div><div style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 18.6667px; line-height: inherit; font-family: &quot;Source Sans Pro&quot;; vertical-align: baseline; color: rgb(100, 100, 100); letter-spacing: normal; text-transform: none;\"><p style=\"box-sizing: inherit; margin-bottom: 2em; border: 0px; font: inherit; vertical-align: baseline; color: rgb(170, 170, 170);\">펜을 감시하는 곳. Journalista 가입을 환영합니다.</p>")
							.append("<p style=\"box-sizing: inherit; margin-top: 2em; margin-bottom: 2em; border: 0px; font: inherit; vertical-align: baseline; color: rgb(187, 187, 187);\"><a href='http://localhost:8089/member/emailConfirm?email=")
							.append(vo.getEmail()).append("&key=").append(key)
							.append("' target='_blenk'rel=\"noreferrer noopener\" style=\"box-sizing: inherit; color: rgb(170, 170, 170); text-decoration-line: none; background-color: transparent; margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: dotted; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgba(160, 160, 160, 0.65); border-left-color: initial; border-image: initial; font: inherit; vertical-align: baseline; transition: color 0.2s ease 0s, border-bottom-color 0.2s ease 0s;\">이메일 인증 확인</a></p></div></h2></div></td>\r\n" + 
									"</tr>\r\n" + 
									"</tbody>\r\n" + 
									"</table>")
							.toString());
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
