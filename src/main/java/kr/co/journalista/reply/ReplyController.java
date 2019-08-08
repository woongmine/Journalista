package kr.co.journalista.reply;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.journalista.ReplyVO;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	
	@Inject
	ReplyService service;
	
	// 댓글입력
	@RequestMapping("/insert")
	public void insert(ReplyVO replyVO, HttpSession session) throws Exception{
		String userId = (String) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		replyVO.setEmail(userId);
		replyVO.setName(userName);
		logger.info("userId"+ userId);
		service.create(replyVO);
	}
	
//	// 댓글 목록
//	@RequestMapping("/list")
//	public ModelAndView list(@RequestParam int wr_no, ModelAndView mav) throws Exception{
//		List<ReplyVO>list = service.list(wr_no);
//		mav.setViewName("reply/replyList");
//		mav.addObject("list",list);
//		return mav;
//	}
	
	//댓글 목록
	@RequestMapping("/listJson")
	@ResponseBody
	public List<ReplyVO>listJson(@RequestParam int wr_no) throws Exception{
		List<ReplyVO>list = service.list(wr_no);
		return list;
	}
}