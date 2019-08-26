package kr.co.journalista.ereply;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.journalista.EreplyVO;
import kr.co.journalista.member.ClientUtils;

@RestController
@RequestMapping("/ereply/*")
public class EreplyController {
private static final Logger logger = LoggerFactory.getLogger(EreplyController.class);
	
	@Inject
	EreplyService service;
	
	@RequestMapping("/insert")
	public void insert(EreplyVO ereplyVO, HttpSession session, HttpServletRequest request)throws Exception{
		logger.info("insert EREPLY~~~~~~~~~~~~~");
		String userId = (String)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		ereplyVO.setEmail(userId);
		ereplyVO.setName(userName);
		ereplyVO.setEre_ip(ClientUtils.getRemoteIP(request));
		service.create(ereplyVO);
	}
	
	
	 
	  @RequestMapping("/listJson")	  
	  @ResponseBody public List<EreplyVO>listJson(@RequestParam int e_no) throws Exception{
	  logger.info("listJson~~~~~~~~");
	  List<EreplyVO>list = service.list(e_no);
	  
	  return list; }
	 

	
	@RequestMapping("/replydelete")
	public void delete(@RequestParam int ere_no) throws Exception{
		logger.info("delete ereply~~~~~~~~~~~~");
		service.delete(ere_no);
	}
	
}
