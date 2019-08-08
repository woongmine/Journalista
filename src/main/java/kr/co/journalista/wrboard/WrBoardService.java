package kr.co.journalista.wrboard;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.journalista.WrBoardVO;

public interface WrBoardService {

	
	// 게시물 입력
	public void write(WrBoardVO vo) throws Exception;
	
	// 게시물 수정
	public void update(WrBoardVO vo) throws Exception;
	 
	// 게시물 삭제
	public void delete(int wr_no) throws Exception;
	 
	// 게시물 조회
	public WrBoardVO view(int wr_no) throws Exception;
	
	// 게시물 목록
	public List<WrBoardVO> list() throws Exception;
	
	// 게시물 총 갯수
	public int count() throws Exception;
	
	// 페이징
	public List<WrBoardVO> listPage(int displayPost, int postNum) throws Exception;

	public int viewafterwrite() throws Exception;
	
	public void updateReadcnt(int wr_no) throws Exception;

	public int minpage() throws Exception;
	
	//총 게시글 개수 확인

	public List<WrBoardVO> getBoardList(Search search) throws Exception;

	public int getBoardListCnt(Search search) throws Exception;

	
}
