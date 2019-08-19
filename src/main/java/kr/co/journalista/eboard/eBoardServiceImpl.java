package kr.co.journalista.eboard;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.journalista.eBoardVO;

@Service
public class eBoardServiceImpl implements eBoardService {
	@Inject
	private eBoardDAO dao;
	
	@Override
	public void write(eBoardVO vo) throws Exception {
		Date date = new Date();
		vo.setWr_datetime(date);
		dao.write(vo);
	}

	@Override
	public void update(eBoardVO vo) throws Exception {
		 dao.update(vo);
	}

	@Override
	public void delete(int wr_no) throws Exception {
		 dao.delete(wr_no);
	}

	@Override
	public eBoardVO view(int wr_no) throws Exception {
		return dao.view(wr_no);
	}

	@Override
	public List<eBoardVO> list() throws Exception {
		return dao.list();
	}

	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
	  return dao.count();
	}

	// 페이징
	@Override
	public List<eBoardVO> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public int viewafterwrite() throws Exception {
		return dao.viewafterwrite();
	}

	@Override
	public void updateReadcnt(int wr_no) throws Exception {
		dao.updateReadcnt(wr_no);
		
	}

	@Override
	public int minpage() throws Exception {
		return dao.minpage();
	}


	@Override
	public int getBoardListCnt(Criteria cri) throws Exception {
		return dao.getBoardListCnt(cri);
	}
	
	@Override
	public List<eBoardVO> getBoardList(Criteria cri) throws Exception {
		return dao.getBoardList(cri);
	}

	@Override
	public int first_score(eBoardVO vo) throws Exception {
		return dao.first_score(vo);
	}

}
