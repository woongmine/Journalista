package kr.co.journalista.reply;

import java.util.List;

import kr.co.journalista.ReplyVO;

public interface ReplyDAO {
	
	//댓글 목록
	public List<ReplyVO>list(Integer wr_no)throws Exception;
	
	//댓글 입력
	public void create(ReplyVO vo)throws Exception;
	
	//댓글 수정
	public void update(ReplyVO vo)throws Exception;
	
	//댓글 삭제
	public void delete(Integer re_no)throws Exception;
	
}
