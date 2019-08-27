package kr.co.journalista.search;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "kr.co.journalista.mappers.wrboardMapper";

	@Override
	public void journalistSearch() throws Exception {
		
	}

}
