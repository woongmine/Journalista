package kr.co.journalista.admin;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.journalista.AdminVO;
import kr.co.journalista.JournalVO;
import kr.co.journalista.PressVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession sql;
	
	private static String namespace = "kr.co.journalista.mappers.adminMapper";
	@Override
	public void addAdmin(AdminVO vo) throws Exception {
		sql.insert(namespace+".admin_register",vo);
		
	}
	@Override
	public AdminVO getAdmin(AdminVO vo) throws Exception {
		return sql.selectOne(namespace+".getAdmin",vo);
	}
	@Override
	public void addJournal(JournalVO vo) throws Exception {
		sql.insert(namespace+".journal_register", vo);		
	}
	@Override
	public void addPress(PressVO vo) throws Exception {
		sql.insert(namespace+".press_register", vo);		
	}
	@Override
	public JournalVO getJournalEmail(JournalVO vo) throws Exception {
		return sql.selectOne(namespace+".getJournalEmail",vo);
	}
	@Override
	public PressVO getPress(PressVO vo) throws Exception {
		return sql.selectOne(namespace+".getPressName",vo);
	}

}
