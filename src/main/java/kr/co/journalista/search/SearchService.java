package kr.co.journalista.search;

import java.util.List;

import kr.co.journalista.JournalVO;
import kr.co.journalista.eboard.Criteria;

public interface SearchService {

	public List<JournalVO> journalistSearch(Criteria cri) throws Exception;

}
