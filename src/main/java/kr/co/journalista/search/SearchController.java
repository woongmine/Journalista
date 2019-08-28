package kr.co.journalista.search;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.journalista.JournalVO;
import kr.co.journalista.eboard.Criteria;

@Controller
@RequestMapping(value = "/search")
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	SearchService service;
	
	@RequestMapping(value = "/journalistSearch")
	public void journalistSearch() throws Exception{
		logger.info("기자검색페이지");
	}
	
	@RequestMapping(value = "/journalistSearchComplete")
	public void journalistSearchComplete(Criteria cri, Model model) throws Exception{
		logger.info("기자검색 들어감");
		List<JournalVO> journal = service.journalistSearch(cri);
		model.addAttribute("jorunal", journal);
		
	}	
	@RequestMapping(value = "/pressSearch")
	public void pressSearch() throws Exception{
		
	}
	
	@RequestMapping(value = "/totalSearch")
	public void totalSearch() throws Exception{
		
	}
	
}
