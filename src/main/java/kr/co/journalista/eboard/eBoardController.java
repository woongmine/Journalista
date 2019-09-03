package kr.co.journalista.eboard;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.journalista.JournalVO;
import kr.co.journalista.LikeVO;
import kr.co.journalista.eBoardVO;

@Controller
@RequestMapping(value = "/eboard")
public class eBoardController {
	
	@Inject
	eBoardService service;

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
    
	
	@RequestMapping(value = "write")
	public String getWrite(eBoardVO vo, HttpSession session) throws Exception{
		System.out.println("write 기자 : " + vo.getName());
		System.out.println("trackback : " + vo.getTrackback());
		int m_no = Integer.parseInt((String) session.getAttribute("login_member_no"));
		String writer_name = (String) session.getAttribute("userName");
		vo.setWriter_name(writer_name);
		vo.setM_no(m_no);
		System.out.println(m_no);
		String url = vo.getTrackback();
		Document doc = Jsoup.connect(url).get();
		Elements elements = doc.select("title");
		String temp = elements.text();
		String[] articletitle = temp.split("-|:");
		vo.setArticletitle(articletitle[0]);
		
		service.write(vo);
		service.total_score(vo);
		
		return "redirect:/eboard/listPage";
	}
	
	@RequestMapping(value = "like", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int like(int e_no, HttpSession session) throws Exception{
		System.out.println("hi");
		String login_email = (String) session.getAttribute("login_email");
		System.out.println(login_email);
		String login_member_no = (String) session.getAttribute("login_member_no");
		System.out.println(login_member_no);
		eBoardVO vo = new eBoardVO();
		if (login_member_no != null) {
			vo.setM_no(Integer.parseInt(login_member_no));
		}
		vo.setE_no(e_no);
        System.out.println("e_no : " + vo.getE_no());
		
		if (login_email != null) {
			System.out.println("여기오니");
			service.like(vo);
			int like_check = service.like_or_unlike(vo);
			return like_check;
		}
		else {
			return 3;
		}
	}
	
	@RequestMapping(value="/infiniteScrollDown", method = RequestMethod.POST)
	public @ResponseBody List<eBoardVO> infiniteScrollDownPOST(@RequestBody eBoardVO vo, LikeVO likevo, HttpSession session) throws Exception{
		String login_member_no = (String) session.getAttribute("login_member_no");
		Integer eno = vo.getE_no();
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
	
	@RequestMapping(value="/search_name", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<JournalVO> SearchPOST(JournalVO vo) throws Exception{
		System.out.println("start");
		String Journal_name = vo.getJournal_name();
		System.out.println(Journal_name);
		System.out.println(vo.getJ_no());
		List<JournalVO> search_list = service.search(vo);
		return search_list;
		
	}
	
	@RequestMapping(value="/search_no", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<JournalVO> Search_no(JournalVO vo) throws Exception{
		System.out.println("start");
		int Journal_no = vo.getJ_no();
		System.out.println(Journal_no);
		System.out.println(vo.getJ_no());
		List<JournalVO> search_list = service.search_no(vo);
		return search_list;
		
	}

	@RequestMapping(value="/best_ranking", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<JournalVO> Best_Ranking(JournalVO vo) throws Exception{
		List<JournalVO> best_list = service.best_ranking();
		return best_list;
	}

	@RequestMapping(value="/worst_ranking", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<JournalVO> Worst_Ranking(JournalVO vo) throws Exception{
		List<JournalVO> best_list = service.worst_ranking();
		return best_list;
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
	   @RequestMapping(value = "/Delete", method = RequestMethod.GET)
	   public void getDelete(@RequestParam("e_no") int e_no, Model model, HttpSession session, HttpServletResponse response) throws Exception {
	      PrintWriter writer = response.getWriter();
	      response.setCharacterEncoding("utf-8");
	      response.setContentType("text/html; utf-8");
	      String login_member_no = (String) session.getAttribute("login_member_no");
	      eBoardVO vo = new eBoardVO();
	      vo = service.getBoardForDelete(e_no);
	      if(login_member_no != null) {
		     int loginM_no = Integer.parseInt(login_member_no);
		     int writerM_no = vo.getM_no();
	         if(loginM_no != writerM_no){
	            writer.write("<script> alert(\"본인만 지울 수 있다.\"); location.href='/eboard/listPage';</script>");
	         }
	         else {
	            service.delete(e_no);
	            writer.write("<script> alert(\"삭제됐다.\"); location.href='/eboard/listPage';</script>");
	         }
	      }
	      else {
	         writer.write("<script> alert(\"로그인 하셍.\"); location.href='/eboard/listPage';</script>");
	      }
	   }
	
	
}
