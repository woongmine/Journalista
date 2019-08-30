package kr.co.journalista.search;

import java.util.List;

import kr.co.journalista.JournalVO;

public interface SearchDAO {

	public List<JournalVO> journalistSearch(String journal_name) throws Exception;
	
	public JournalVO journalistDetails(int j_no) throws Exception; 
}
