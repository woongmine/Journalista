package kr.co.journalista.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.journalista.JournalVO;
import kr.co.journalista.WrBoardVO;
import kr.co.journalista.eBoardVO;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "kr.co.journalista.mappers.searchMapper";

	@Override
	public List<JournalVO> journalistSearch(String journal_name) throws Exception {
		return sql.selectList(namespace+".searchjournalist", journal_name);
	}

	// 기자 상세 페이지
	@Override
	public JournalVO journalistDetails(int j_no) throws Exception {
		return sql.selectOne(namespace+".journalistDetails", j_no);
	}
	@Override
	public List<eBoardVO> journalistDetailsSub(int j_no) throws Exception {
		return sql.selectList(namespace+".journalistDetailsSub", j_no);
	}

	// 통합검색
	@Override
	public List<eBoardVO> totalEboard(String keyword) throws Exception {
		return sql.selectList(namespace+".totalEboard", keyword);
	}
	@Override
	public List<JournalVO> totalJournalist(String keyword) throws Exception {
		return sql.selectList(namespace+".totalJournalist", keyword);
	}
	@Override
	public List<WrBoardVO> totalWrboard(String keyword) throws Exception {
		return sql.selectList(namespace+".totalWrboard", keyword);
	}


}
