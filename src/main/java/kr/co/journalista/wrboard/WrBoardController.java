package kr.co.journalista.wrboard;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.journalista.WrBoardVO;
import kr.co.journalista.member.MemberController;

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
	public String postWrite(WrBoardVO vo) throws Exception {
		service.write(vo);
		return "redirect:/wrboard/listPage?num=1";
	}

	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("wr_no") int wr_no, Model model) throws Exception {
		WrBoardVO view = null;
		view = service.view(wr_no);
		model.addAttribute("view", view);
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
		System.out.println(vo.getName());
	}

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(WrBoardVO vo) throws Exception {

		service.update(vo);

		return "redirect:/wrboard/listPage?num=1";
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("wr_no") int wr_no, Model model) throws Exception {
		WrBoardVO view = null;
		view = service.view(wr_no);

		model.addAttribute("view", view);
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(WrBoardVO vo) throws Exception {

		service.delete(vo.getWr_no());

		return "redirect:/wrboard/listPage?num=1";
	}

	// 게시물 목록 - 페이징 구현
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(Model model, int num) throws Exception {

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
}
