package kr.co.journalista.search;

import java.util.List;

import kr.co.journalista.JournalVO;

public interface SearchService {

	public List<JournalVO> journalistSearch(String journal_name) throws Exception;

}
