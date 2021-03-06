package kr.co.journalista.wrboard;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.journalista.WrBoardVO;

@Repository
public class WrBoardDAOImpl implements WrBoardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "kr.co.journalista.mappers.wrboardMapper";

	@Override
	public void write(WrBoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public void update(WrBoardVO vo) throws Exception {
		sql.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int wr_no) throws Exception {
		sql.update(namespace + ".delete", wr_no);
	}

	@Override
	public WrBoardVO view(int wr_no) throws Exception {
		return sql.selectOne(namespace + ".view", wr_no);
	}

	@Override
	public List<WrBoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
	  return sql.selectOne(namespace + ".count");
	}
	
	@Override
	public List<WrBoardVO> listPage(int displayPost, int postNum) throws Exception {
	  
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

//	@Override
//	public List<WrBoardVO> getBoardList(Search search) {
//		return sql.selectList(namespace + ".getBoardList", search);
//	}
//
//	@Override
//
//	public int getBoardListCnt(Search search) throws Exception {
//		return sql.selectOne(namespace + ".getBoardListCnt", search);
//	}

	@Override
	public List<WrBoardVO> getBoardList(Criteria cri) {
		return sql.selectList(namespace + ".getBoardList", cri);
	}

	@Override

	public int getBoardListCnt(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getBoardListCnt", cri);
	}

}
