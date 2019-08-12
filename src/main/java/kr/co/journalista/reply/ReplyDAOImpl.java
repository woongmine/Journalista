package kr.co.journalista.reply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.journalista.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sql;
	
	
	@Override
	public List<ReplyVO> list(Integer wr_no) throws Exception {
		return sql.selectList("reply.listReply", wr_no);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		sql.insert("reply.insertReply", vo);
		
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		sql.update("reply.updateReply", vo);
		
	}

	@Override
	public void delete(Integer re_no) throws Exception {
		sql.delete("reply.deleteReply", re_no);
	}

}
