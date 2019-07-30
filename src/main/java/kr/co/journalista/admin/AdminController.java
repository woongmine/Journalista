package kr.co.journalista.admin;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.journalista.AdminVO;
import kr.co.journalista.JournalVO;
import kr.co.journalista.PressVO;
import kr.co.journalista.member.MemberController;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	private AdminService service;
	//추가 컨트롤러들
	//관리자 추가,기자추가,언론사추가 페이지 연결
	@RequestMapping(value = "/admin/addmember", method = RequestMethod.GET)
	public void getLogin() throws Exception{
		logger.info("get addmember");
	}
    //관리자 추가 POST
    @RequestMapping(value="/admin/addAdmin", method=RequestMethod.POST)
    public String addadminPOST(AdminVO vo) throws Exception {   
        service.addAdmin(vo);
        return "redirect:/admin/addmember";
    }
    
    //기자 추가
    @RequestMapping(value="admin/addJournal", method=RequestMethod.POST)
    public String addJournalPOST(JournalVO vo) throws Exception {
    	service.addJournal(vo);
    	return "redirect:/admin/addmember";
    }
    
    //언론사 추가
    @RequestMapping(value="admin/addPress", method=RequestMethod.POST)
    public String addPressPOST(PressVO vo) throws Exception {
    	service.addPress(vo);
    	return "redirect:/admin/addmember";
    }
    
    //중복확인 컨트롤러들
    //ajax 아이디 중복확인
    @ResponseBody
    @RequestMapping(value="/admin/checkId", method=RequestMethod.POST)
    public int idCheck(AdminVO vo, ModelAndView mav) throws Exception {
    	logger.info("아이디중복확인");
    	int result = 0; //리턴할 변수 초기화
    	AdminVO admin = service.getAdmin(vo);
    	if(admin!=null) result=1; //1일 경우 아이디 사용 불가
    	else logger.info("아이디 사용 가능");
    	return result;
    }
    //ajax 기자 이메일 중복확인
    @ResponseBody
    @RequestMapping(value="/admin/checkJournal", method=RequestMethod.POST)
    public int JournalCheck(JournalVO vo, ModelAndView mav) throws Exception {
    	logger.info("기자 이메일 중복확인");
    	int result = 0; //리턴할 변수 초기화
    	JournalVO journal = service.getJournalEmail(vo);
    	if(journal!=null) result=1; //1일 경우 아이디 사용 불가
    	else logger.info("이메일 사용가능");
    	return result;
    }
    //ajax 언론사 이름 중복확인
    @ResponseBody
    @RequestMapping(value="/admin/checkPress", method=RequestMethod.POST)
    public int PressCheck(PressVO vo, ModelAndView mav) throws Exception {
    	logger.info("언론사 이름 중복확인");
    	int result = 0; //리턴할 변수 초기화
    	PressVO press = service.getPress(vo);
    	if(press!=null) result=1; //1일 경우 아이디 사용 불가
    	else logger.info("언론사 이름 사용가능");
    	return result;
    }
    
}