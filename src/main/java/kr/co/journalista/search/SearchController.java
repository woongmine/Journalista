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
import kr.co.journalista.PressVO;
import kr.co.journalista.WrBoardVO;
import kr.co.journalista.eBoardVO;

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
		List<eBoardVO> journalistDetailsSub = service.journalistDetailsSub(j_no);
		model.addAttribute("journalistDetail", journalistDetail);
		model.addAttribute("journalistDetailsSub", journalistDetailsSub);
	}
	
	@RequestMapping(value = "/pressSearch")
	public void pressSearch(Model model) throws Exception{
		logger.info("언론사 검색 페이지 진입");
		List<PressVO> press = service.pressSearch();
		model.addAttribute("press", press);
	}
	
	@RequestMapping(value = "/pressSearchComplete")
	public void pressSearchComplete(@RequestParam(value = "press_name") String press_name, Model model) throws Exception{
		logger.info("언론사 검색됨");
		List<JournalVO> pressSearch = service.pressSearchComplete(press_name);
		model.addAttribute("pressSearch", pressSearch);
	}
	
	@RequestMapping(value = "/totalSearch")
	public void totalSearch(@RequestParam(value = "keyword") String keyword, Model model) throws Exception{
		logger.info("통합검색 들어감"+keyword);
		List<eBoardVO> totalEboard = service.totalEboard(keyword);
		List<JournalVO> totalJournalist = service.totalJournalist(keyword);
		List<WrBoardVO> totalWrboard = service.totalWrboard(keyword);
		String selectkeyword = keyword;
		model.addAttribute("keyword", selectkeyword);
		model.addAttribute("totalEboard", totalEboard);
		model.addAttribute("totalJournalist", totalJournalist);
		model.addAttribute("totalWrboard", totalWrboard);
	}
	
}
