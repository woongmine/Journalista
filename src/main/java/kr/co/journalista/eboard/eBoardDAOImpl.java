package kr.co.journalista.eboard;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.journalista.LikeVO;
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
	public List<LikeVO> getLikeList(LikeVO vo) {
		return sql.selectList(namespace + ".getLikeList", vo);
	}
	
	@Override
	public List<eBoardVO> getBoardList(eBoardVO vo) {
		return sql.selectList(namespace + ".getBoardList", vo);
	}


	@Override

	public int getBoardListCnt(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getBoardListCnt", cri);
	}

	@Override
	public int first_score(eBoardVO vo) throws Exception {
		return sql.update(namespace + ".first_score", vo);
	}

	@Override
	public void like(eBoardVO vo) throws Exception {
		sql.update(namespace + ".like", vo);
		int sum = sql.selectOne(namespace + ".sum_like", vo);
		vo.setLike(sum);
		System.out.println("sum : " + vo.getLike());
		sql.update(namespace + ".update_like", vo);
	}

	@Override
	public void unlike(eBoardVO vo) throws Exception {
		sql.update(namespace + ".unlike", vo);
		int sum = sql.selectOne(namespace + ".sum_like", vo);
		vo.setLike(sum);
		System.out.println("sum : " + vo.getLike());
		sql.update(namespace + ".update_like", vo);
	}

	@Override
	public int like_check(eBoardVO vo) throws Exception {
		int like_check = sql.selectOne(namespace + ".like_check", vo);
		return like_check;
	}

	@Override
	public int like_or_unlike(eBoardVO vo) throws Exception {
		return sql.selectOne(namespace + ".like_or_unlike", vo);
	}

	@Override
	public void insert_like(eBoardVO vo) throws Exception {
		sql.insert(namespace + ".insert_like", vo);
		int sum = sql.selectOne(namespace + ".sum_like", vo);
		vo.setLike(sum);
		System.out.println("sum : " + vo.getLike());
		sql.update(namespace + ".update_like", vo);
	}

//	@Override
//	public void sum_like(eBoardVO vo) throws Exception {
//		int sum_like = sql.selectOne(namespace + ".sum_like");
//		System.out.println(sum_like);
//		sql.insert(namespace + ".insert_sum_like", sum_like);
//	}

}
