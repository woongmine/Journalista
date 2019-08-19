package kr.co.journalista.eboard;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.journalista.eBoardVO;

@Repository
public class eBoardDAOImpl implements eBoardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "kr.co.journalista.mappers.eboardMapper";

	@Override
	public void write(eBoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public void update(eBoardVO vo) throws Exception {
		sql.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int wr_no) throws Exception {
		sql.update(namespace + ".delete", wr_no);
	}

	@Override
	public eBoardVO view(int wr_no) throws Exception {
		return sql.selectOne(namespace + ".view", wr_no);
	}

	@Override
	public List<eBoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
	  return sql.selectOne(namespace + ".count");
	}
	
	@Override
	public List<eBoardVO> listPage(int displayPost, int postNum) throws Exception {
	  
	  HashMap<String, Integer> myMap = new HashMap<String, Integer>();

	  myMap.put("displayPost", displayPost);
	  myMap.put("postNum", postNum);
	      
	  return sql.selectList(namespace + ".listPage", myMap);
	}

	@Override
	public int updateReadcnt(int wr_no) throws Exception {
		return sql.update(namespace + ".updateReadcnt", wr_no);
	}

	@Override
	public int viewafterwrite() throws Exception {
		return sql.selectOne(namespace + ".viewafterwrite");
	}

	@Override
	public int minpage() throws Exception {
		return sql.selectOne(namespace + ".minpage");
	}


	@Override
	public List<eBoardVO> getBoardList(Criteria cri) {
		return sql.selectList(namespace + ".getBoardList", cri);
	}

	@Override

	public int getBoardListCnt(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getBoardListCnt", cri);
	}

	@Override
	public int first_score(eBoardVO vo) throws Exception {
		return sql.update(namespace + ".first_score", vo);
	}

}
