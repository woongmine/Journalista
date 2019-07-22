package kr.co.journalista.register;

import java.io.PrintWriter;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String postRegister(MemberVO vo, Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception{
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		logger.info("가입폼들어감");
		logger.info(vo.toString());

		if(vo.getEmail() == "" || vo.getName() == "" || vo.getPassword() == "" || vo.getPassword() == "") {
			writer.write("<script> alert(\"모든 빈칸을 채워주셔야 합니다.\"); location.href='register';</script>");
		}
		else if(!vo.getPassword().equals(vo.getPasswordCheck())) {
			System.out.println(vo.getPassword() + ", " + vo.getPasswordCheck());
			writer.write("<script> alert(\"비밀번호를 확인해주세요.\"); location.href='register';</script>");
		}
		else {
			Date date = new Date();
			vo.setReg_date(date);
			service.create(vo);
			writer.write("<script> alert(\"회원가입 완료.\"); location.href='/';</script>");
		}

		rttr.addFlashAttribute("authmsg" , "가입시 사용한 이메일로 인증해주 3");

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
	
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public Model emailConfirm(String email, Model model) throws Exception { // 이메일인증
		service.userAuth(email);
		return model.addAttribute("email", email);
	}
	
	@RequestMapping(value = "/registerComplete")
	public String registerComplete() throws Exception{
		return "member/registerComplete";
	}
	
}
