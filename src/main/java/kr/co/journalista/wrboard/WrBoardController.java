package kr.co.journalista.wrboard;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.journalista.MemberVO;
import kr.co.journalista.WrBoardVO;
import kr.co.journalista.member.ClientUtils;

@Controller
@RequestMapping(value = "/wrboard")
public class WrBoardController {
	
	@Inject
	WrBoardService service;
	
	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public void list(Model model) throws Exception {

		List<WrBoardVO> list = null;
		list = service.list();

		model.addAttribute("list", list);

	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {

	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public void postWrite(WrBoardVO vo, HttpSession session, HttpServletResponse response,HttpServletRequest request) throws Exception {
		
		int num = 0;
		
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
        String login_email = (String) session.getAttribute("login_email");
		System.out.println("sessionemail : " + login_email);
		vo.setWr_ip(ClientUtils.getRemoteIP(request));	
		
		if(login_email != null) {
			service.write(vo);
			num =  service.viewafterwrite();
			writer.write("<script> alert(\"작성완료.\"); location.href='/wrboard/view?wr_no=" + num + "';</script>");
		
			
		}
		else {
			writer.write("<script> alert(\"로그인 하셍.\"); location.href='/wrboard/listPage?num=1';</script>");
		}
		
	}
	
	// 다음 글
	@RequestMapping(value = "/next", method = RequestMethod.GET)
	public void nextView(@RequestParam("wr_no") int wr_no, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		WrBoardVO vo = null;
		wr_no = wr_no + 1;
		vo = service.view(wr_no);
		while(vo.getWr_del() == 1) {
			System.out.println("wr_no = " + vo.getWr_no() + ", wr_del = " + vo.getWr_del());
			wr_no = wr_no + 1;
			vo = service.view(wr_no);
		}
		writer.write("<script> location.href='/wrboard/view?wr_no=" + wr_no + "';</script>");
	}
	
	// 이전 글
	@RequestMapping(value = "/past", method = RequestMethod.GET)
	public void pastView(@RequestParam("wr_no") int wr_no, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		WrBoardVO vo = null;
		wr_no = wr_no - 1;
		vo = service.view(wr_no);
		while(vo.getWr_del() == 1) {
			System.out.println("wr_no = " + vo.getWr_no() + ", wr_del = " + vo.getWr_del());
			wr_no = wr_no - 1;
			vo = service.view(wr_no);
		}
		writer.write("<script> location.href='/wrboard/view?wr_no=" + wr_no + "';</script>");
	}
	
	// 게시물 조회
	int temp_no = 0;
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("wr_no") int wr_no, Model model, HttpSession session) throws Exception {
		WrBoardVO view = null;
		view = service.view(wr_no);
		model.addAttribute("view", view);
		int max = service.viewafterwrite();
		session.setAttribute("max", max);
		int min = service.minpage();
		session.setAttribute("min", min);
		
		
//		if(wr_no < max) {
//			WrBoardVO view1 = null;
//			view1 = service.view(wr_no + 1);
//			model.addAttribute("next", view1);
//		}
		session.setAttribute("email", view.getEmail());
		String se_email = (String) session.getAttribute("email");
		if(view.getEmail() == se_email & view.getWr_no() != temp_no) {
			service.updateReadcnt(wr_no);
		}
		temp_no = view.getWr_no();
		
		int num = 1;
		// 게시물 총 갯수
		int count = service.count();

		// 한 페이지에 출력할 게시물 갯수
		int postNum = 5;

		// 게시물 총 갯수 / 한 페이지에 출력할 게시물 갯수 = 하단 페이징
		int pageNum = (int) Math.ceil((double) count / (double) 5);
		
		// 선택한 페이지 번호(임시)
//		int selectNum = 1;

		// 출력할 게시물
		int displayPost = (num - 1) * 5;
	
		List<WrBoardVO> list = null;
		list = service.listPage(displayPost, postNum);  

		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
	}

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdate(@RequestParam("wr_no") int wr_no, Model model, HttpSession session) throws Exception {
		WrBoardVO vo = null;
		vo = service.view(wr_no);
//		model.addAttribute("view", vo);
		
		session.setAttribute("name", vo.getName());
		session.setAttribute("wr_no", vo.getWr_no());
		session.setAttribute("wr_title", vo.getWr_title());
		session.setAttribute("wr_contents", vo.getWr_contents());
		session.setAttribute("writeremail", vo.getEmail());
		
	}

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void postUpdate(WrBoardVO vo, HttpSession session, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
        String login_email = (String) session.getAttribute("login_email");
		System.out.println("sessionemail : " + login_email);
		String writer_email = (String) session.getAttribute("writeremail");
		System.out.println("writeremail : " + writer_email);
		if(login_email != null) {
			if(!login_email.equals(writer_email)) {
				writer.write("<script> alert(\"꼼수 쓰지마라 다 막아버린다.\"); location.href='/wrboard/view?wr_no=" + vo.getWr_no() + "';</script>");
			}
			else {
				service.update(vo);
				writer.write("<script> alert(\"수정됐다.\"); location.href='/wrboard/view?wr_no=" + vo.getWr_no() + "';</script>");
			}
		}
		else {
			writer.write("<script> alert(\"로그인 하셍.\"); location.href='/wrboard/listPage?num=1';</script>");
		}
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("wr_no") int wr_no, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		WrBoardVO view = null;
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		view = service.view(wr_no);
		String login_email = (String) session.getAttribute("login_email");
		System.out.println("sessionemail : " + login_email);
		String writer_email = view.getEmail();
		System.out.println("writeremail : " + writer_email);
		if(login_email != null) {
			if(!login_email.equals(writer_email)) {
				writer.write("<script> alert(\"본인만 지울 수 있다.\"); location.href='/wrboard/view?wr_no=" + wr_no + "';</script>");
			}
			else {
				service.delete(view.getWr_no());
				writer.write("<script> alert(\"삭제됐다.\"); location.href='/wrboard/listPage?num=1';</script>");
			}
		}
		else {
			writer.write("<script> alert(\"로그인 하셍.\"); location.href='/wrboard/listPage?num=1';</script>");
		}
		model.addAttribute("view", view);
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(WrBoardVO vo) throws Exception {
		service.delete(vo.getWr_no());

		return "redirect:/wrboard/listPage?num=1";
	}

	// 게시물 목록 - 페이징 구현
//	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
//	public void listPage(Model model, int num) throws Exception {
//		
//		// 게시물 총 갯수
//		int count = service.count();
//
//		// 한 페이지에 출력할 게시물 갯수
//		int postNum = 5;
//
//		// 게시물 총 갯수 / 한 페이지에 출력할 게시물 갯수 = 하단 페이징
//		int pageNum = (int) Math.ceil((double) count / (double) 5);
//		
//		// 선택한 페이지 번호(임시)
////		int selectNum = 1;
//
//		// 출력할 게시물
//		int displayPost = (num - 1) * 5;
//		  
//	
//		List<WrBoardVO> list = null;
//		list = service.listPage(displayPost, postNum);  
//
//		model.addAttribute("list", list);
//		model.addAttribute("pageNum", pageNum);
//		
//	}


	
//	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
//
//	public String getBoardList(Model model, HttpSession session, 
//			@RequestParam(required = false, defaultValue = "1") int page, 
//			@RequestParam(required = false, defaultValue = "1") int range, 
//			@RequestParam(required = false, defaultValue = "wr_title") String searchType, 
//			@RequestParam(required = false, defaultValue = "all") String category,
//			@RequestParam(required = false) String keyword) throws Exception {
//
//		Search search = new Search();
//
//		search.setSearchType(searchType);
//
//		search.setKeyword(keyword);
//		
//		search.setCategory(category);
//		
//		//전체 게시글 개수
//
//		int listCnt = service.getBoardListCnt(search);
//
//		//Pagination 객체생성
//
//		Pagination pagination = new Pagination();
//
//		search.pageInfo(page, range, listCnt);
//
//		model.addAttribute("pagination", search);
//
//		model.addAttribute("list", service.getBoardList(search));
//		
//		session.setAttribute("searchType", searchType);
//		session.setAttribute("keyword", keyword);
//		System.out.println("searchType : " + searchType);
//		System.out.println("keyword : " + keyword);
//		
//		return "wrboard/listPage";
//
//	}
	
	@RequestMapping(value = "/listPage")
	public void getBoardList(Criteria cri, Model model) throws Exception{
        //현재 페이지에 해당하는 게시물을 조회해 옴 
		List<WrBoardVO> allboard = service.getBoardList(cri);
        //모델에 추가
		model.addAttribute("list", allboard);
        //PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
        //전체 게시물 수를 구함
		int totalCount = service.getBoardListCnt(cri);
        //pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
        //모델에 추가
		model.addAttribute("pageMaker", pageMaker);
	}
    
}
