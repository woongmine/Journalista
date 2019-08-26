package kr.co.journalista.ereply;

import java.util.List;

import kr.co.journalista.EreplyVO;

public interface EreplyService {

	public List<EreplyVO> list(Integer e_no) throws Exception;

	public void create(EreplyVO vo) throws Exception;

	public void delete(Integer ere_no) throws Exception;

}
