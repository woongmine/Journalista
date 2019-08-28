package kr.co.journalista.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.journalista.JournalVO;
import kr.co.journalista.eboard.Criteria;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "kr.co.journalista.mappers.searchMapper";

	@Override
	public List<JournalVO> journalistSearch(Criteria cri) throws Exception {
		return sql.selectList(namespace+".searchjournalist", cri);
	}


}
