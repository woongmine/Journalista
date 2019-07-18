package kr.co.journalista.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Inject
	BoardService service;

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public void list(Model model) throws Exception {

		List<BoardVO> list = null;
		list = service.list();

		model.addAttribute("list", list);

	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String getWrite() throws Exception {
		return "board/write";
	}

	// 게시물 작성
	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String postWrite(BoardVO vo) throws Exception {
		service.write(vo);
		return "redirect:/board/list";

	}

	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO view = null;
		view = service.view(bno);
		model.addAttribute("view", view);
	}

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdate(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO view = null;
		view = service.view(bno);

		model.addAttribute("view", view);
	}

	// 게시물 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(BoardVO vo) throws Exception {

		service.update(vo);

		return "redirect:/board/list";
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO view = null;
		view = service.view(bno);

		model.addAttribute("view", view);
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(BoardVO vo) throws Exception {

		service.delete(vo.getBno());

		return "redirect:/board/list";
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
		  
		List<BoardVO> list = null;
		list = service.listPage(displayPost, postNum);  

		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
	}

}
