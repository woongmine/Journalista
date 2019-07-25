package kr.co.journalista.member;

import kr.co.journalista.MemberVO;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	

	//로그아웃 컨트롤러
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}	
	
	//마이페이지로 이동하는 컨트롤러
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void getmypage() throws Exception{
		logger.info("get mypage");
	}
	//회원정보 수정 겟, 포스트
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getmypage_update() throws Exception{
		logger.info("get mypage_update");
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postmypage_update(HttpSession session, MemberVO vo) throws Exception {
		logger.info("post mypage_update");
		service.mypage_update(vo); 
		session.invalidate();	 
		return "redirect:/";
	}
	//마이페이지 회원 탈퇴
	@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
	public void postwithdrawal(HttpSession session, MemberVO vo, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		logger.info("post withdrawal");
		service.mypage_withdrawal(vo, session); 
		writer.write("<script> alert(\"탈퇴 완료. 안녕히 가세요ㅠ\"); location.href='/';</script>");
		session.invalidate();
	}
	
	//로그인 겟,포스트
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception{
		logger.info("get login");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(MemberVO vo, HttpServletRequest req, HttpServletResponse response)throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		MemberVO login = service.login(vo);
		if (login.getLeave() == 1) {
			writer.write("<script> alert(\"탈퇴한 회원은 로그인 할 수 없습니다.\"); location.href='login';</script>");
		} 
		else {
			session.setAttribute("member", login);
			writer.write("<script>  location.href='/';</script>");
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception{
		logger.info("post idcheck");
		
		String userId = req.getParameter("userId");
		MemberVO idCheck = service.idCheck(userId);
		
		int result = 0;
		
		if(idCheck!=null) {
			result = 1;
		}
		
		return result;
	}
	
}