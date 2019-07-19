package kr.co.journalista.member;

import javax.inject.Inject;

import kr.co.journalista.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	// 아이디중복체크
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		return dao.idCheck(userId);
	}

	//회원정보 수정
	@Override
	public void mypage_update(MemberVO vo) throws Exception {
		dao.mypage_update(vo);
	}
}
