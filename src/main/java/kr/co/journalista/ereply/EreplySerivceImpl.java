package kr.co.journalista.ereply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.journalista.EreplyVO;

@Service
public class EreplySerivceImpl implements EreplyService {
	@Inject
	private EreplyDAO dao;

	@Override
	public List<EreplyVO> list(Integer e_no) throws Exception {
		return dao.list(e_no);
	}

	@Override
	public void create(EreplyVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void delete(Integer ere_no) throws Exception {
		dao.delete(ere_no);
	}

}
