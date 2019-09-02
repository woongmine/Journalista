package kr.co.journalista.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{

		logger.info("로그인했음 로그인페이지 ㄴ");
			HttpSession session = request.getSession();
			if(session.getAttribute("login") != null) {
				logger.info("로그인 이미 했음 !!!!!");
				response.sendRedirect(request.getContextPath()+"/");
				return false;
			}else {
				logger.info("로그인 정보 없음 통과!!!!1");
				return true;
			}
		
		
	}
	


}
