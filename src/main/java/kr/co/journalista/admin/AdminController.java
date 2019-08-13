package kr.co.journalista.admin;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.journalista.AdminVO;
import kr.co.journalista.JournalVO;
import kr.co.journalista.MemberVO;
import kr.co.journalista.PressVO;
import kr.co.journalista.WrBoardVO;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
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
    
	@RequestMapping(value = "/admin/userManage")
	public String allmember(Model model) throws Exception{
		logger.info("관리자모드 유저전체");
		List<MemberVO> allmember= null;
		allmember = service.allmember();
		
		model.addAttribute("allmember", allmember);
		
		return "admin/userManage";
	}
	
	@RequestMapping(value = "/admin/memberDelete", method = RequestMethod.POST)
	public String memberDelete(@RequestParam(value="m_noArray[]") List<Integer> m_noArray) throws Exception{
		logger.info("관리자모드 유저삭제" + m_noArray);		
		service.memberDelete(m_noArray);
		return "admin/userManage";
	}
	
	@RequestMapping(value = "/admin/updateView")
	public String updateView(Model model, int m_no, HttpServletRequest httpServletRequest) throws Exception{
		logger.info("관리자모드 유저정보수정 페이지 진입");
		String temp = httpServletRequest.getParameter("m_no");
		m_no = Integer.parseInt(temp);
		model.addAttribute("member", service.updateView(m_no));
		return "/admin/updateView";
	}
	
	@RequestMapping(value = "/admin/userUpdate")
	public String userUpdate(@ModelAttribute("member") MemberVO vo, Model model) throws Exception{
		logger.info("관리자모드 유저정보수정 실행");
		service.userUpdate(vo);
		
		return "redirect:memberPage";
	}
	
	@RequestMapping(value = "/admin/memberPage")
	public void memberPage(Criteria cri, Model model) throws Exception{
		logger.info("memberPage");
        //현재 페이지에 해당하는 게시물을 조회해 옴 
		List<MemberVO> allmember = service.memberPage(cri);
        //모델에 추가
		model.addAttribute("allmember", allmember);
        //PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
        //전체 게시물 수를 구함
		int totalCount = service.getTotalCount(cri);
        //pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
        //모델에 추가
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/admin/wrboardPage")
	public void wrboardPage(Criteria cri, Model model) throws Exception{
		logger.info("wrboardPage");
        //현재 페이지에 해당하는 게시물을 조회해 옴 
		List<WrBoardVO> allWrboard = service.wrboardPage(cri);
        //모델에 추가
		model.addAttribute("allWrboard", allWrboard);
        //PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
        //전체 게시물 수를 구함
		int totalCount = service.wrgetTotalCount(cri);
        //pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
        //모델에 추가
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/admin/wrboardDelete", method = RequestMethod.POST)
	public String wrboardDelete(@RequestParam(value="wr_noArray[]") List<Integer> wr_noArray) throws Exception{
		logger.info("관리자모드 기타게시물삭제" + wr_noArray);
		service.wrboardDelete(wr_noArray);
		return "admin/wrboardPage";
	}
    
}