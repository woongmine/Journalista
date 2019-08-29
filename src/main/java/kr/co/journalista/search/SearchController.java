package kr.co.journalista.search;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value = "/journalistSearchComplete", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView journalistSearchComplete(@RequestBody String journal_name, ModelAndView mav) throws Exception{
		String journal_name_temp = journal_name.substring(0, journal_name.length()-1);
		logger.info("기자검색 들어감"+journal_name_temp);
		List<JournalVO> journal = service.journalistSearch(journal_name_temp);
		mav.setViewName("/search/journalistSearch");
		mav.addObject("journal", journal);
		return mav;
	}	
	@RequestMapping(value = "/pressSearch")
	public void pressSearch() throws Exception{
		
	}
	
	@RequestMapping(value = "/totalSearch")
	public void totalSearch() throws Exception{
		
	}
	
}
