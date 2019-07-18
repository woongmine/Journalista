package kr.co.journalista.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.journalista.board.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "kr.co.journalista.mappers.boardMapper";

	@Override
	public void write(BoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sql.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);
	}

	@Override
	public BoardVO view(int bno) throws Exception {
		return sql.selectOne(namespace + ".view", bno);
	}

	@Override
	public List<BoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
	  return sql.selectOne(namespace + ".count");
	}
	
	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
	  
	  HashMap<String, Integer> myMap = new HashMap<String, Integer>();

	  myMap.put("displayPost", displayPost);
	  myMap.put("postNum", postNum);
	      
	  return sql.selectList(namespace + ".listPage", myMap);
	}

	@Override
	public int updateReadcnt(int bno) throws Exception {
		return sql.update(namespace + ".updateReadcnt", bno);
	}

}
