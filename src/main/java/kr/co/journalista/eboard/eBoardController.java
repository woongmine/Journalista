package kr.co.journalista.eboard;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.journalista.LikeVO;
import kr.co.journalista.eBoardVO;

@Controller
@RequestMapping(value = "/eboard")
public class eBoardController {
	
	@Inject
	eBoardService service;
	
	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public void list(Model model) throws Exception {

		List<eBoardVO> list = null;
		list = service.list();

		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/listPage")
	public void getBoardList(LikeVO vo, eBoardVO boardvo, Model model, HttpSession session) throws Exception{
		String login_member_no = (String) session.getAttribute("login_member_no");
		if(login_member_no != null) {
			boardvo.setM_no(Integer.parseInt(login_member_no));
			System.out.println(login_member_no);
				List<eBoardVO> likelist = service.getLikeList(boardvo);
				List<eBoardVO> all_list = service.getBoardList(boardvo);
				for (eBoardVO boardlist : all_list) { 
					for (eBoardVO like_list : likelist) { 
						if (boardlist.getE_no() == like_list.getE_no()) { 
							boardlist.setLike_check(like_list.getLike_check()); 
							} 
						} 
					}
				model.addAttribute("boardlist", all_list);
		}
		else {
			List<eBoardVO> all_list = service.getBoardList(boardvo);
			model.addAttribute("boardlist", all_list);
		}
	}
    
	@RequestMapping(value = "first_score")
	public String getScore(eBoardVO vo) throws Exception{
		service.write(vo);
		System.out.println(vo.getScore());
		
		return "redirect:/eboard/listPage";
	}

	@RequestMapping(value = "write")
	public String getWrite(eBoardVO vo) throws Exception{
		System.out.println("trackback : " + vo.getTrackback());
		System.out.println("evaluation : " + vo.getEvaluation());
		service.write(vo);
		
		return "redirect:/eboard/listPage";
	}
	
	@RequestMapping(value = "like")
	public void getlike(eBoardVO vo, HttpSession session, HttpServletResponse response) throws Exception{
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		System.out.println("hi");
		String login_email = (String) session.getAttribute("login_email");
		System.out.println(login_email);
		String login_member_no = (String) session.getAttribute("login_member_no");
		System.out.println(login_member_no);
		if (login_member_no != null) {
			vo.setM_no(Integer.parseInt(login_member_no));
		}
        System.out.println("e_no : " + vo.getE_no());
		
		if (login_email != null) {
			service.like(vo);
			writer.write("<script> location.href='/eboard/listPage'; event.preventDefault();</script>");
		}
		else {
			writer.write("<script> alert(\"로그인을 해주세요.\"); location.href='/eboard/listPage';</script>");
		}
	}
	
	@RequestMapping(value="/infiniteScrollDown", method = RequestMethod.POST)
	public @ResponseBody List<eBoardVO> infiniteScrollDownPOST(@RequestBody eBoardVO vo, LikeVO likevo, HttpSession session) throws Exception{
		String login_member_no = (String) session.getAttribute("login_member_no");
		Integer eno = vo.getE_no();
		System.out.println(eno);
		if(login_member_no != null) {
			vo.setM_no(Integer.parseInt(login_member_no));
			List<eBoardVO> likelist = service.getLikeList(vo);
			List<eBoardVO> scroll_list = service.infiniteScrollDown(eno);
			for (eBoardVO scrolllist : scroll_list) { 
				for (eBoardVO like_list : likelist) { 
					if (scrolllist.getE_no() == like_list.getE_no()) { 
						scrolllist.setLike_check(like_list.getLike_check()); 
						} 
					}
				}
			return scroll_list;
		}
		else {
			return service.infiniteScrollDown(eno);
		}
		
	}
	
	@RequestMapping(value="/infiniteScrollUp", method = RequestMethod.POST)
	public @ResponseBody List<eBoardVO> infiniteScrollUpPOST(@RequestBody eBoardVO vo, LikeVO likevo, HttpSession session) throws Exception{
		String login_member_no = (String) session.getAttribute("login_member_no");
		Integer eno = vo.getE_no();
		System.out.println(eno);
		if(login_member_no != null) {
			vo.setM_no(Integer.parseInt(login_member_no));
			List<eBoardVO> likelist = service.getLikeList(vo);
			List<eBoardVO> scroll_list = service.infiniteScrollUp(eno);
			for (eBoardVO scrolllist : scroll_list) { 
				for (eBoardVO like_list : likelist) { 
					if (scrolllist.getE_no() == like_list.getE_no()) { 
						scrolllist.setLike_check(like_list.getLike_check()); 
						} 
					}
				}
			return scroll_list;
		}
		else {
			return service.infiniteScrollUp(eno);
		}
		
	}
	
	
//	@RequestMapping(value = "/write", method = RequestMethod.GET)
//	public void getWrite() throws Exception {
//
//	}
//
//	// 게시물 작성
//	@RequestMapping(value = "/write", method = RequestMethod.POST)
//	public void postWrite(eBoardVO vo, HttpSession session, HttpServletResponse response) throws Exception {
//		
//		int num = 0;
//		
//		PrintWriter writer = response.getWriter();
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("text/html; utf-8");
//        String login_email = (String) session.getAttribute("login_email");
//		System.out.println("sessionemail : " + login_email);
//		
//		if(login_email != null) {
//			service.write(vo);
//			num =  service.viewafterwrite();
//			writer.write("<script> alert(\"작성완료.\"); location.href='/eboard/view?e_no=" + num + "';</script>");
//		
//			
//		}
//		else {
//			writer.write("<script> alert(\"로그인 하셍.\"); location.href='/eboard/listPage?num=1';</script>");
//		}
//		
//	}
	
	// 다음 글
	@RequestMapping(value = "/next", method = RequestMethod.GET)
	public void nextView(@RequestParam("e_no") int e_no, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		eBoardVO vo = null;
		e_no = e_no + 1;
		vo = service.view(e_no);
		while(vo.getE_del() == 1) {
			System.out.println("e_no = " + vo.getE_no() + ", e_del = " + vo.getE_del());
			e_no = e_no + 1;
			vo = service.view(e_no);
		}
		writer.write("<script> location.href='/eboard/view?e_no=" + e_no + "';</script>");
	}
	
	// 이전 글
	@RequestMapping(value = "/past", method = RequestMethod.GET)
	public void pastView(@RequestParam("e_no") int e_no, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		eBoardVO vo = null;
		e_no = e_no - 1;
		vo = service.view(e_no);
		while(vo.getE_del() == 1) {
			System.out.println("e_no = " + vo.getE_no() + ", e_del = " + vo.getE_del());
			e_no = e_no - 1;
			vo = service.view(e_no);
		}
		writer.write("<script> location.href='/eboard/view?e_no=" + e_no + "';</script>");
	}
	
	// 게시물 조회
	int temp_no = 0;
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("e_no") int e_no, Model model, HttpSession session) throws Exception {
		eBoardVO view = null;
		view = service.view(e_no);
		model.addAttribute("view", view);
		int max = service.viewafterwrite();
		session.setAttribute("max", max);
		int min = service.minpage();
		session.setAttribute("min", min);
		

		session.setAttribute("email", view.getEmail());
		String se_email = (String) session.getAttribute("email");
		if(view.getEmail() == se_email & view.getE_no() != temp_no) {
			service.updateReadcnt(e_no);
		}
		temp_no = view.getE_no();
		
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
	
		List<eBoardVO> list = null;
		list = service.listPage(displayPost, postNum);  

		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
	}

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdate(@RequestParam("e_no") int e_no, Model model, HttpSession session) throws Exception {
		eBoardVO vo = null;
		vo = service.view(e_no);
//		model.addAttribute("view", vo);
		
		session.setAttribute("name", vo.getName());
		session.setAttribute("wr_no", vo.getE_no());
		session.setAttribute("wr_title", vo.getE_title());
		session.setAttribute("wr_contents", vo.getE_contents());
		session.setAttribute("writeremail", vo.getEmail());
		
	}

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void postUpdate(eBoardVO vo, HttpSession session, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
        String login_email = (String) session.getAttribute("login_email");
		System.out.println("sessionemail : " + login_email);
		String writer_email = (String) session.getAttribute("writeremail");
		System.out.println("writeremail : " + writer_email);
		if(login_email != null) {
			if(!login_email.equals(writer_email)) {
				writer.write("<script> alert(\"꼼수 쓰지마라 다 막아버린다.\"); location.href='/eboard/view?e_no=" + vo.getE_no() + "';</script>");
			}
			else {
				service.update(vo);
				writer.write("<script> alert(\"수정됐다.\"); location.href='/eboard/view?e_no=" + vo.getE_no() + "';</script>");
			}
		}
		else {
			writer.write("<script> alert(\"로그인 하셍.\"); location.href='/eboard/listPage?num=1';</script>");
		}
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("e_no") int e_no, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		eBoardVO view = null;
		PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; utf-8");
		view = service.view(e_no);
		String login_email = (String) session.getAttribute("login_email");
		System.out.println("sessionemail : " + login_email);
		String writer_email = view.getEmail();
		System.out.println("writeremail : " + writer_email);
		if(login_email != null) {
			if(!login_email.equals(writer_email)) {
				writer.write("<script> alert(\"본인만 지울 수 있다.\"); location.href='/eboard/view?e_no=" + e_no + "';</script>");
			}
			else {
				service.delete(view.getE_no());
				writer.write("<script> alert(\"삭제됐다.\"); location.href='/eboard/listPage?num=1';</script>");
			}
		}
		else {
			writer.write("<script> alert(\"로그인 하셍.\"); location.href='/eboard/listPage?num=1';</script>");
		}
		model.addAttribute("view", view);
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(eBoardVO vo) throws Exception {
		service.delete(vo.getE_no());

		return "redirect:/eboard/listPage?num=1";
	}
	
	
}
