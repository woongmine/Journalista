package kr.co.journalista.board;

import java.util.List;

import kr.co.journalista.board.BoardVO;

public interface BoardService {

	// 게시물 입력
	public void write(BoardVO vo) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO vo) throws Exception;
	 
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	 
	// 게시물 조회
	public BoardVO view(int bno) throws Exception;
	
	// 게시물 목록
	public List<BoardVO> list() throws Exception;
	
	// 게시물 총 갯수
	public int count() throws Exception;
	
	// 페이징
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception;
}
