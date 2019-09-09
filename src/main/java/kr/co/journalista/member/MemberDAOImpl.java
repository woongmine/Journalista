package kr.co.journalista.member;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import kr.co.journalista.LoginDTO;
import kr.co.journalista.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "kr.co.journalista.mappers.memberMapper";

	// 로그인
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return sql.selectOne(namespace + ".login", dto);
	}

	// 아이디 중복체크
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		return sql.selectOne(namespace + ".idCheck", userId);
	}

	// 회원정보 수정
	@Override
	@Transactional
	public int mypage_update(MemberVO vo) throws Exception {
		return sql.update(namespace + ".update_mypage", vo);
	}

	// 자동로그인 로그인유지
	@Override
	public void keepLogin(String email, String sessionId, Date next) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		sql.update(namespace + ".keepLogin", paramMap);

	}

	// 자동로그인 세션키
	@Override
	public MemberVO checkUserWithSessionKey(String sessionId) {
		return sql.selectOne(namespace + ".checkUserWithSessionKey", sessionId);
	}

	// 마이페이지에서 회원탈퇴 마이바티스 sql실행
	@Override
	public void mypage_withdrawal(MemberVO vo) throws Exception {
		sql.update(namespace + ".mypage_withdrawal", vo);
	}

	@Override
	public String passCheck(String email) throws Exception {
		return sql.selectOne(namespace + ".passCheck", email);
	}
	
	@Override
	public void update_pw(MemberVO vo) throws Exception {
		 sql.update(namespace + ".update_pw", vo);
	}
}
