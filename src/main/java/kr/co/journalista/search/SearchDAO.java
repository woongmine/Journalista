package kr.co.journalista.search;

import java.util.List;

import kr.co.journalista.JournalVO;
import kr.co.journalista.PressVO;
import kr.co.journalista.WrBoardVO;
import kr.co.journalista.eBoardVO;

public interface SearchDAO {

	public List<JournalVO> journalistSearch(String journal_name) throws Exception;
	
	// 기자 검색&상세보기
	public JournalVO journalistDetails(int j_no) throws Exception;
	public List<eBoardVO> journalistDetailsSub(int j_no) throws Exception;
	
	// 통합검색
	public List<eBoardVO> totalEboard(String keyword) throws Exception;
	public List<JournalVO> totalJournalist(String keyword) throws Exception;
	public List<WrBoardVO> totalWrboard(String keyword) throws Exception;

	// 언론사 검색 페이지
	public List<PressVO> pressSearch() throws Exception;
	public List<JournalVO> pressSearchComplete(String press_name) throws Exception;
	}