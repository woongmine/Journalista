package kr.co.journalista.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{

		logger.info("관리자 권한 체크");
		
		
		HttpSession session = request.getSession();
		Integer authcheck = (Integer) session.getAttribute("auth");

			if(authcheck == 1) {
				logger.info("관리자 번호 아님!!!!");
				response.sendRedirect(request.getContextPath()+"/");
				return false;
			}else {
				logger.info("관리자번호 맞음!!!!!!!!");
				return true;
			}
	}
}
