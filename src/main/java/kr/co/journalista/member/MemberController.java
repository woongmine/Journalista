package kr.co.journalista.member;

import kr.co.journalista.LoginDTO;
import kr.co.journalista.MemberVO;

import java.io.PrintWriter;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
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
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

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
		service.mypage_update(vo);
		session.invalidate();
		return "redirect:/";
	}

	// 마이페이지 회원 탈퇴
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


		MemberVO vo = service.login(dto);
		session.setAttribute("userId", vo.getEmail());
		session.setAttribute("userName", vo.getName());
		logger.info("userId=="+vo.getEmail());
		logger.info("userName=="+vo.getName());
		
		if (vo == null) {
			rttr.addFlashAttribute("msg", "retry");
			return "redirect:/member/login";
		} else if (vo.getLeave() == 1) { //탈퇴회원 구별
			logger.info("--------------탈퇴회원--------------------");
			rttr.addFlashAttribute("mag","retry");
			return "redirect:/member/login";
		}

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
}