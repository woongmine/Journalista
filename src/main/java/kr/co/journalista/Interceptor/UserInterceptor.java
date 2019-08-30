package kr.co.journalista.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class UserInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(UserInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
//		logger.info("컨트롤비트요맨남~!!!!!!~!~!~!~!!~!~!~");
//		try {
//			if(request.getSession().getAttribute("loginInfo") == null) {
//				logger.info("로그인 정보 없음 !!!!1");
//				response.sendRedirect(request.getContextPath()+"/member/needLogin");
//				return false;
//			}else {
//				logger.info("로그인 정보 있음 통과!!!!1");
//				return true;
//			}
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		return super.preHandle(request, response, handler);
		logger.info("컨트롤비트요맨남~!!!!!!~!~!~!~!!~!~!~");
			HttpSession session = request.getSession();
			if(session.getAttribute("login") == null) {
				logger.info("로그인 정보 없음 !!!!1");
				response.sendRedirect(request.getContextPath()+"/member/needLogin");
				return false;
			}else {
				logger.info("로그인 정보 있음 통과!!!!1");
				return true;
			}
		
		
	}
	
}
	