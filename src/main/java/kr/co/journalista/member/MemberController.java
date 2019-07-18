package kr.co.journalista.member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
	
	 // 글 작성 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
		
	}
	
	// 글 작성 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo, Model model, RedirectAttributes rttr) throws Exception{
        System.out.println("regesterPost 진입 ");
		logger.info("post register");
		service.register(vo);
        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
		
		return "redirect:/";
	}
	
//    //이메일 인증 코드 검증
//    @RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
//    public String emailConfirm(MemberVO vo, Model model, RedirectAttributes rttr) throws Exception { 
//        
//        System.out.println("cont get user"+vo);
//        MemberVO user = new MemberVO();
//        user=service.userAuth(vo);
//        if(user == null) {
//            rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
//            return "redirect:/";
//        }
//        //System.out.println("usercontroller vo =" +vo);
//        model.addAttribute("login",user);
//        return "/user/emailConfirm";
//    }

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception{
		logger.info("get login");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req)throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
		} else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/";
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