package kr.co.journalista.admin;

import java.util.List;

import kr.co.journalista.AdminVO;
import kr.co.journalista.JournalVO;
import kr.co.journalista.MemberVO;
import kr.co.journalista.PressVO;

public interface AdminService {
	
	//관리자 추가
	public void addAdmin(AdminVO vo) throws Exception;
	
	//기자 추가
	public void addJournal(JournalVO vo) throws Exception;
	
	//언론사 추가
	public void addPress(PressVO vo) throws Exception;
	
	//관리자 아이디 중복확인
	AdminVO getAdmin(AdminVO vo) throws Exception;
	
	//기자 이메일 중복확인
	JournalVO getJournalEmail(JournalVO vo) throws Exception;
	
	//언론사 이름 중복확인
	PressVO getPress(PressVO vo) throws Exception;
	
	// 회원 전체 목록 보기
	public List<MemberVO> allmember() throws Exception;

	// 회원 삭제(leave 0을 1로)
	public int memberDelete(List<Integer> m_noArray) throws Exception;
	
	// 회원 정보 수정 페이지 view
	public MemberVO updateView(int m_no) throws Exception;
	
	// 회원 정보 수정
	public void userUpdate(MemberVO vo) throws Exception;
	
	//memberPage 메소드 추가
	List<MemberVO> memberPage(Criteria cri) throws Exception;
	int getTotalCount(Criteria cri) throws Exception;

}
