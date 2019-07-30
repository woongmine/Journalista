package kr.co.journalista.admin;

import kr.co.journalista.AdminVO;
import kr.co.journalista.JournalVO;
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
}
