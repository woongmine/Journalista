package kr.co.journalista.member;

import javax.inject.Inject;

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
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
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
}
