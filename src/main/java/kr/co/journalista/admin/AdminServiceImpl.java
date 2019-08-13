package kr.co.journalista.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.journalista.AdminVO;
import kr.co.journalista.JournalVO;
import kr.co.journalista.MemberVO;
import kr.co.journalista.PressVO;
import kr.co.journalista.WrBoardVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;
	
	@Override
	public void addAdmin(AdminVO vo) throws Exception{
		dao.addAdmin(vo);		
	}

	@Override
	public AdminVO getAdmin(AdminVO vo) throws Exception {
		return dao.getAdmin(vo);
	}

	@Override
	public void addJournal(JournalVO vo) throws Exception {
		dao.addJournal(vo);		
	}

	@Override
	public void addPress(PressVO vo) throws Exception {
		dao.addPress(vo);		
	}
	//기자 이메일 중복확인 dao불러서 실행하는 서비스 메소드
	@Override
	public JournalVO getJournalEmail(JournalVO vo) throws Exception {
		return dao.getJournalEmail(vo);
	}
	//언론사 이름 중복확인 dao불러서 실행하는 서비스 메소드
	@Override
	public PressVO getPress(PressVO vo) throws Exception {
		return dao.getPress(vo);
	}
	
	// 회원 전체 목록 보기
	@Override
	public List<MemberVO> allmember() throws Exception {
		return dao.allmember();
	}
	
	// 회원 삭제(leave 0을 1로)
	@Override
	public int memberDelete(List<Integer> m_noArray) throws Exception {
		return dao.memberDelete(m_noArray);
	}

	@Override
	public MemberVO updateView(int m_no) throws Exception {
		return dao.updateView(m_no);
	}
	
	// 회원 정보 수정
	@Override
	public void userUpdate(MemberVO vo) throws Exception {
		dao.userUpdate(vo);
	}
	
	//memberPage 메소드 추가
	@Override
	public List<MemberVO> memberPage(Criteria cri) throws Exception {
		return dao.memberPage(cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return dao.getTotalCount(cri);
	}
	
	@Override
	public List<WrBoardVO> wrboardPage(Criteria cri) throws Exception {
		return dao.wrboardPage(cri);
	}

	@Override
	public int wrgetTotalCount(Criteria cri) throws Exception {
		return dao.wrgetTotalCount(cri);
	}

	@Override
	public int wrboardDelete(List<Integer> wr_noArray) throws Exception {
		return dao.wrboardDelete(wr_noArray);
	}

}
