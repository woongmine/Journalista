package kr.co.journalista.eboard;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.journalista.JournalVO;
import kr.co.journalista.LikeVO;
import kr.co.journalista.eBoardVO;

@Service
public class eBoardServiceImpl implements eBoardService {
	@Inject
	private eBoardDAO dao;

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
	public List<eBoardVO> getLikeList(eBoardVO vo) throws Exception {
		return dao.getLikeList(vo);
	}
	
	@Override
	public List<eBoardVO> getBoardList(eBoardVO vo) throws Exception {
		return dao.getBoardList(vo);
	}

	@Override
	public int write(eBoardVO vo) throws Exception {
		Date date = new Date();
		vo.setE_datetime(date);
		return dao.write(vo);
	}

	@Override
	public void like(eBoardVO vo) throws Exception {
		int like_check = dao.like_check(vo);	//db에 있는지 확인
		if(like_check == 0) {	//없으면
			dao.insert_like(vo);	//생성 후 좋아요
		}
		else {	//있으면
			int like_or_unlike = dao.like_or_unlike(vo);
			if(like_or_unlike == 1) {	//좋아요 상태인지 아닌지 확인. 좋아요 상태라면,
				dao.unlike(vo);
			}
			else {
				dao.like(vo);
			}
		}
	}

	@Override
	public List<eBoardVO> infiniteScrollDown(Integer eno) throws Exception {
		return dao.infiniteScrollDown(eno);
	}

	@Override
	public List<eBoardVO> infiniteScrollUp(Integer eno) throws Exception {
		return dao.infiniteScrollUp(eno);
	}

	@Override
	public List<JournalVO> search(JournalVO vo) throws Exception {
		return dao.search(vo);
	}

	@Override
	public List<JournalVO> search_no(JournalVO vo) throws Exception {
		return dao.search_no(vo);
	}

	@Override
	public void total_score(eBoardVO vo) throws Exception {
		dao.total_score(vo);
	}

	@Override
	public List<JournalVO> best_ranking() throws Exception {
		return dao.best_ranking();
	}

	@Override
	public List<JournalVO> worst_ranking() throws Exception {
		return dao.worst_ranking();
	}


}
