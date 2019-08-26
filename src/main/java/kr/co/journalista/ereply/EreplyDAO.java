package kr.co.journalista.ereply;

import java.util.List;

import kr.co.journalista.EreplyVO;

public interface EreplyDAO {

	// 목록
	public List<EreplyVO> list(Integer e_no) throws Exception;

	// 입력
	public void create(EreplyVO vo) throws Exception;

	// 삭제
	public void delete(Integer ere_no) throws Exception;

}
