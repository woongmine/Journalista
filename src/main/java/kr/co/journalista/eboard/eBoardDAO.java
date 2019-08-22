package kr.co.journalista.eboard;

import java.util.List;

import kr.co.journalista.LikeVO;
import kr.co.journalista.eBoardVO;


public interface eBoardDAO {

	// 게시물 입력
	public void write(eBoardVO vo) throws Exception;
	
	// 게시물 수정
	public void update(eBoardVO vo) throws Exception;
	 
	// 게시물 삭제
	public void delete(int wr_no) throws Exception;
	 
	// 게시물 조회
	public eBoardVO view(int wr_no) throws Exception;
	public int updateReadcnt(int wr_no) throws Exception;
	
	// 게시물 목록
	public List<eBoardVO> list() throws Exception;
	
	// 게시물 총 갯수
	public int count() throws Exception;
	
	// 페이징
	public List<eBoardVO> listPage(int displayPost, int postNum) throws Exception;

	public int viewafterwrite() throws Exception;

	public int minpage() throws Exception;
	
	//총 게시글 개수 확인
	public List<eBoardVO> getLikeList(eBoardVO vo);
	public List<eBoardVO> getBoardList(eBoardVO vo);
	public int getBoardListCnt(Criteria cri) throws Exception;

	public int first_score(eBoardVO vo) throws Exception;

	public void like(eBoardVO vo) throws Exception;

	public void unlike(eBoardVO vo) throws Exception;

	public int like_check(eBoardVO vo) throws Exception;

	public int like_or_unlike(eBoardVO vo) throws Exception;

	public void insert_like(eBoardVO vo) throws Exception;

//	public void sum_like(eBoardVO vo) throws Exception;
}
