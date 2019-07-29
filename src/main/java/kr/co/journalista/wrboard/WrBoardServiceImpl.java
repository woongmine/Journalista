package kr.co.journalista.wrboard;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.journalista.WrBoardVO;

@Service
public class WrBoardServiceImpl implements WrBoardService {
	@Inject
	private WrBoardDAO dao;
	
	@Override
	public void write(WrBoardVO vo) throws Exception {
		Date date = new Date();
		vo.setWr_datetime(date);
		dao.write(vo);
	}

	@Override
	public void update(WrBoardVO vo) throws Exception {
		 dao.update(vo);
	}

	@Override
	public void delete(int wr_no) throws Exception {
		 dao.delete(wr_no);
	}

	@Override
	public WrBoardVO view(int wr_no) throws Exception {
		dao.updateReadcnt(wr_no);
		return dao.view(wr_no);
	}

	@Override
	public List<WrBoardVO> list() throws Exception {
		return dao.list();
	}

	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
	  return dao.count();
	}

	// 페이징
	@Override
	public List<WrBoardVO> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}
}
