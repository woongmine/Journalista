package kr.co.journalista.reply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.journalista.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	
	// 댓글목록
	@Override
	public List<ReplyVO> list(Integer wr_no) throws Exception {
		return dao.list(wr_no);
	}
	
	//댓글 작성
	@Override
	public void create(ReplyVO vo) throws Exception {
		dao.create(vo);
	}
	
	//댓글 수정
	@Override
	public void update(ReplyVO vo) throws Exception {
		dao.update(vo);
	}
	
	//댓글 삭제
	@Override
	public void delete(Integer re_no) throws Exception {
		dao.delete(re_no);
	}

}
