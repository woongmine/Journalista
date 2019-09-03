package kr.co.journalista.member;

import kr.co.journalista.LoginDTO;
import kr.co.journalista.MemberVO;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	

	// 마이페이지로 이동하는 컨트롤러

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void getmypage() throws Exception {
		logger.info("get mypage");
	}

	// 회원정보 수정 겟, 포스트
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getmypage_update() throws Exception {
		logger.info("get mypage_update");
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postmypage_update(HttpSession session, MemberVO vo) throws Exception {
		logger.info("post mypage_update");
		String email = (String)session.getAttribute("login_email");
		String nick = vo.getName();
		String pass = vo.getPassword();
		String passCk = vo.getPasswordCheck();
		logger.info("비밀번호:"+pass);
		logger.info("비밀번호확인:"+passCk);
			
		String encryptPassword = passwordEncoder.encode(pass);
		vo.setPassword(encryptPassword);
	
		System.out.println("암호화된 비밀번호는======="+encryptPassword);
		
		
		
		if(pass.equals(passCk)) {
			//패스와 패스확인이 일치하고 널값이 아닌경우
			if(nick.length() <= 8 && pass.length() >0 ) {
				//글자수가 8자리 이상
				logger.info("모든 조건 만족");
				nick = nick.replace(" ", "");//닉네임 공백제거
				vo.setName(nick);
				vo.setEmail(email);
				service.mypage_update(vo);
				session.invalidate();
				return "redirect:/member/login";
			} else {
				logger.info("8자리 이상 아님");
				//8자리 이하가 아니네 에러페이지로 리다이렉트
				return "redirect:/";
			}
		} else {
			logger.info("넌 특별하다");
			//패스워드랑 패스워드확인이 일치하지 않는 경우 에러페이지로 리다이렉트
			return "redirect:/";
		}
	}

	// 마이페이지 회원 탈퇴
	@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
	public void postwithdrawal(HttpSession session, MemberVO vo, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		logger.info("post withdrawal");
		String email = (String)session.getAttribute("login_email");
		vo.setEmail(email);
		service.mypage_withdrawal(vo, session);
		writer.write("<script> alert(\"탈퇴 완료. 안녕히 가세요ㅠ\"); location.href='/';</script>");
		session.invalidate();
	}

	// 로그인 겟,포스트
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception {
		logger.info("get login");
	}

	// 로그인 처리(자동로그인포함)
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String login(LoginDTO dto, Model model,HttpSession session, RedirectAttributes rttr
				) throws Exception {
			logger.info("post login");
			
			if(session.getAttribute("login") != null) {
				logger.info("로그인 세션 초기화@@@@@@");
				session.removeAttribute("login");
			}
			String dbPassword = service.passCheck(dto.getEmail());		//db에서 받아온 비밀번호
			boolean passMatch =  passwordEncoder.matches(dto.getPassword(), dbPassword);
			
			if (dbPassword == "" || dbPassword == null) {
				rttr.addFlashAttribute("msg", "retry");
				return "redirect:/member/login";
			}
			
			if(passMatch) {			//비밀번호 일치시 
				logger.info("비밀번호 일치치치치치");
				
				dto.setPassword(dbPassword);
				
				MemberVO vo = service.login(dto);
				
				if (vo.getLeave() == 1) { //탈퇴회원 구별
					logger.info("--------------탈퇴회원--------------------");
					rttr.addFlashAttribute("mag","retry");
					return "redirect:/member/login";
				}
				if(vo.getEmail_key() == null) {
					rttr.addFlashAttribute("mvg","retry");
					return "redirect:/member/login";
				}
				
				session.setAttribute("userId", vo.getEmail());
				session.setAttribute("userName", vo.getName());
				session.setAttribute("login", vo);
				logger.info("userId=="+vo.getEmail());
				logger.info("userName=="+vo.getName());
				session.setAttribute("login_email", vo.getEmail());
				session.setAttribute("auth", vo.getAuth());
				session.setAttribute("login_member_no", Integer.toString(vo.getM_no()));
				session.setAttribute("m_no", vo.getM_no());
				System.out.println(vo.getM_no());
				logger.info("m_no======"+vo.getM_no());
				model.addAttribute("member", vo);
				
				// 로그인 유지를 선택할 경우
				if (LoginDTO.isUseCookie()) {
					logger.info("!!!!!!!!!!!!! :" + LoginDTO.isUseCookie());
					int amount = 60 * 60 * 24 * 7; // 7일
					Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));// 로그인 유지기간 설정
					service.keepLogin(vo.getEmail(), session.getId(), sessionLimit);
				}
				
				logger.info("유저 이름은 : " + vo.getName());
				
				return "home";
					
			}else {		//비밀번호 불일치시 
				rttr.addFlashAttribute("msg", "retry");
				return "redirect:/member/login";
			}
		}

	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		logger.info("post idcheck");

		String userId = req.getParameter("userId");
		MemberVO idCheck = service.idCheck(userId);

		int result = 0;

		if (idCheck != null) {
			result = 1;
		}

		return result;
	}

	// 로그아웃(쿠키삭제로 자동로그인을 해결)
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object object = session.getAttribute("member");
		if (object != null) {
			MemberVO vo = (MemberVO) object;
			session.removeAttribute("member");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				logger.info("start");
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getEmail(), "none", new Date());
				logger.info("asdddd");
			} else {
				logger.info("zzzzzz");
			}
		}
		return "/member/logout";
	}
	
	//비밀번호 찾기로 이동
			@RequestMapping(value = "/findpw",  method = RequestMethod.GET)
			public String findpw() throws Exception{
				return "member/findpw";
			}
		
			//비밀번호 변경
			@RequestMapping(value = "/findpw", method = RequestMethod.POST)
			public void findpw(@ModelAttribute MemberVO vo,HttpServletRequest request) throws Exception{
				logger.info("find pw-@@@@@@@@@@@@@@@@");
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				String birthday=request.getParameter("birthday");
						
				logger.info("find email = "+ email);
				logger.info("find name = "+ name);
				logger.info("find birthday = "+ birthday);
				String password = "";
				String st[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
				Random r = new Random();
				for(int i=1; i<=6; i++) {				
					password += st[r.nextInt(26)];				
				}
					
				vo.setEmail(email);
				vo.setName(name);
				vo.setBirthday(birthday);
				vo.setPassword(password);
				service.update_pw(vo);
				logger.info("임시비밀번호는!!!!!!!!!!!!!!!!!!!!!!=================================="+password);
				
			
			}
			@RequestMapping(value="needLogin")
			public ModelAndView needLogin() throws Exception{
				ModelAndView mav = new ModelAndView("/member/loginWarning");
				mav.addObject("msg","로그인 후 이용해주시기 바랍니다.");
				
				return mav;
			}
}