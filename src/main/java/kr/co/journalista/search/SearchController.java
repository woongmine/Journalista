package kr.co.journalista.search;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.journalista.JournalVO;

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
	
	@RequestMapping(value = "/journalistSearchComplete", method = RequestMethod.GET)
	public void journalistSearchComplete(@RequestParam(value = "journal_name") String journal_name, Model model) throws Exception{
		logger.info("기자검색 들어감"+journal_name);
		List<JournalVO> journal = service.journalistSearch(journal_name);
		model.addAttribute("journal", journal);
		
	}
	
	@RequestMapping(value = "/journalistDetails")
	public void journalistDetails(@RequestParam(value = "j_no") int j_no, Model model) throws Exception{
		logger.info("기자상세페이지 들어감"+j_no);
		JournalVO journalistDetail = service.journalistDetails(j_no);
		model.addAttribute("journalistDetail", journalistDetail);
	}
	
	@RequestMapping(value = "/pressSearch")
	public void pressSearch() throws Exception{
		
	}
	
	@RequestMapping(value = "/totalSearch")
	public void totalSearch() throws Exception{
		
	}
	
}
