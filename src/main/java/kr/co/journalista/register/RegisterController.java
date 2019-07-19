package kr.co.journalista.register;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.journalista.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class RegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);

	@Inject
	RegisterService service;
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception{
		logger.info("가입폼들어감");
		service.register(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/emailCheck")
	@ResponseBody
	public String emailCheck(@RequestBody String email) throws Exception {
		logger.info("이메일 중복체크");
		String checkRst;
		int emailCnt = service.emailCheck(email);
		logger.info(email);
		System.out.println(emailCnt);
		
		if(emailCnt>0) {
			checkRst = "F";
		} else {
			checkRst = "S";
		}
		return checkRst;
	}
}
