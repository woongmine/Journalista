package kr.co.journalista.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.journalista.AdminVO;
import kr.co.journalista.JournalVO;
import kr.co.journalista.MemberVO;
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

	// 회원 전체 목록 보기
	@Override
	public List<MemberVO> allmember() throws Exception {
		return sql.selectList(namespace+".allmember");
	}

	// 회원 삭제(leave 0을 1로)
	@Override
	public int memberDelete(List<Integer> m_noArray) throws Exception {
		return sql.update(namespace+".memberDelete", m_noArray);
	}

	@Override
	public MemberVO updateView(int m_no) throws Exception {
		return sql.selectOne(namespace+".updateView", m_no);
	}
	
	// 회원 정보 수정
	@Override
	public int userUpdate(MemberVO vo) throws Exception {
		return sql.update(namespace+".userUpdate", vo);
	}
	
    //memberPage 구현
	@Override
	public List<MemberVO> memberPage(Criteria cri) throws Exception {
		return sql.selectList(namespace+".memberPage", cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace+".gettotalcount", cri);
	}
}
