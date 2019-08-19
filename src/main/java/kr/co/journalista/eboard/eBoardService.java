package kr.co.journalista.eboard;

import java.util.List;


import kr.co.journalista.eBoardVO;

public interface eBoardService {

	
	// 게시물 입력
	public void write(eBoardVO vo) throws Exception;
	
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
	
	//총 게시글 개수 확인
	public int getBoardListCnt(Criteria cri) throws Exception;
	public List<eBoardVO> getBoardList(Criteria cri) throws Exception;

	//별점주기
	public int first_score(eBoardVO vo) throws Exception;
}
