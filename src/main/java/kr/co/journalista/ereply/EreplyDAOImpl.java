package kr.co.journalista.ereply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.journalista.EreplyVO;

@Repository
public class EreplyDAOImpl implements EreplyDAO {
	@Inject
	private SqlSession sql;

	@Override
	public List<EreplyVO> list(Integer e_no) throws Exception {
		return sql.selectList("ereply.listEreply", e_no);
	}

	@Override
	public void create(EreplyVO vo) throws Exception {
		sql.insert("ereply.insertEreply", vo);
	}

	@Override
	public void delete(Integer ere_no) throws Exception {
		sql.delete("ereply.deleteEreply", ere_no);
	}

}
