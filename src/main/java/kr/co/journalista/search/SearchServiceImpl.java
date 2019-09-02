package kr.co.journalista.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.journalista.JournalVO;
import kr.co.journalista.PressVO;
import kr.co.journalista.WrBoardVO;
import kr.co.journalista.eBoardVO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDAO dao;

	@Override
	public List<JournalVO> journalistSearch(String journal_name) throws Exception {
		return dao.journalistSearch(journal_name);
	}

	// 기자 상세페이지
	@Override
	public JournalVO journalistDetails(int j_no) throws Exception {
		return dao.journalistDetails(j_no);
	}
	@Override
	public List<eBoardVO> journalistDetailsSub(int j_no) throws Exception {
		return dao.journalistDetailsSub(j_no);
	}

	// 통합검색
	@Override
	public List<eBoardVO> totalEboard(String keyword) throws Exception {
		return dao.totalEboard(keyword);
	}
	@Override
	public List<JournalVO> totalJournalist(String keyword) throws Exception {
		return dao.totalJournalist(keyword);
	}
	@Override
	public List<WrBoardVO> totalWrboard(String keyword) throws Exception {
		return dao.totalWrboard(keyword);
	}
	
	// 언론사 검색 페이지
	@Override
	public List<PressVO> pressSearch() throws Exception {
		return dao.pressSearch();
	}

	@Override
	public List<JournalVO> pressSearchComplete(String press_name) throws Exception {
		return dao.pressSearchComplete(press_name);
	}

}
