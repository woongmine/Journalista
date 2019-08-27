package kr.co.journalista.search;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.journalista.register.RegisterController;

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
	
	@RequestMapping(value = "/pressSearch")
	public void pressSearch() throws Exception{
		
	}
	
	@RequestMapping(value = "/totalSearch")
	public void totalSearch() throws Exception{
		
	}
	
}
