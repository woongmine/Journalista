package kr.co.journalista.search;

import java.util.List;

import kr.co.journalista.JournalVO;
import kr.co.journalista.WrBoardVO;
import kr.co.journalista.eBoardVO;

public interface SearchDAO {

	public List<JournalVO> journalistSearch(String journal_name) throws Exception;
	
	public JournalVO journalistDetails(int j_no) throws Exception;
	
	public List<eBoardVO> journalistDetailsSub(int j_no) throws Exception;
	
	public List<eBoardVO> totalEboard(String keyword) throws Exception;
	public List<JournalVO> totalJournalist(String keyword) throws Exception;
	public List<WrBoardVO> totalWrboard(String keyword) throws Exception;

	}