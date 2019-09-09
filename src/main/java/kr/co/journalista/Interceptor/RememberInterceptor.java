package kr.co.journalista.Interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.co.journalista.MemberVO;
import kr.co.journalista.member.MemberService;

public class RememberInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(RememberInterceptor.class);

		@Inject
		private MemberService service;
		
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
			 HttpSession httpSession = request.getSession();
			 Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			 if(loginCookie != null) {
				 String sessionId = loginCookie.getValue();				 
				 MemberVO vo = service.checkUserWithSessionKey(sessionId);
				 logger.info("자동로그인이르 해결해보자자자자자자자자자자자");
				 if( vo != null) {
					 httpSession.setAttribute("member", vo);
					 httpSession.setAttribute("userId", vo.getEmail());
					 httpSession.setAttribute("userName", vo.getName());
					 httpSession.setAttribute("login", vo);
					logger.info("userId=="+vo.getEmail());
					logger.info("userName=="+vo.getName());
					httpSession.setAttribute("login_email", vo.getEmail());
					httpSession.setAttribute("auth", vo.getAuth());
					httpSession.setAttribute("login_member_no", Integer.toString(vo.getM_no()));
					httpSession.setAttribute("m_no", vo.getM_no());
					System.out.println(vo.getM_no());
					logger.info("로그인 새션에 부여할수있음");

				 }				 					 
		}
			 return true;
}
}