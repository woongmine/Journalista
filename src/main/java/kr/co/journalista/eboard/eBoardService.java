package kr.co.journalista.eboard;

import java.util.List;

import kr.co.journalista.JournalVO;
import kr.co.journalista.LikeVO;
import kr.co.journalista.eBoardVO;

public interface eBoardService {

	
	// 게시물 수정
	public void update(eBoardVO vo) throws Exception;
	 
	// 게시물 삭제
	public void delete(int wr_no) throws Exception;
	 
	// 게시물 조회
	public eBoardVO view(int wr_no) throws Exception;
	
	// 게시물 목록
	public List<eBoardVO> list() throws Exception;
	
	// 게시물 총 갯수
	public int count() throws Exception;
	
	// 페이징
	public List<eBoardVO> listPage(int displayPost, int postNum) throws Exception;

	public int viewafterwrite() throws Exception;
	
	public void updateReadcnt(int wr_no) throws Exception;

	public int minpage() throws Exception;
	
	public List<eBoardVO> getLikeList(eBoardVO vo) throws Exception;
	public List<eBoardVO> getBoardList(eBoardVO vo) throws Exception;

	//한줄평 쓰기
	public int write(eBoardVO vo) throws Exception;

	public void like(eBoardVO vo) throws Exception;

	public List<eBoardVO> infiniteScrollDown(Integer eno) throws Exception;

	public List<eBoardVO> infiniteScrollUp(Integer eno) throws Exception;

	public List<JournalVO> search(JournalVO vo) throws Exception;

	public List<JournalVO> search_no(JournalVO vo) throws Exception;

	public void total_score(eBoardVO vo) throws Exception;

	public List<JournalVO> best_ranking() throws Exception;

	public List<JournalVO> worst_ranking() throws Exception;


}
