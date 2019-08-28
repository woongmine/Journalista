package kr.co.journalista.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.journalista.JournalVO;
import kr.co.journalista.eboard.Criteria;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDAO dao;

	@Override
	public List<JournalVO> journalistSearch(Criteria cri) throws Exception {
		return dao.journalistSearch(cri);
	}

}
