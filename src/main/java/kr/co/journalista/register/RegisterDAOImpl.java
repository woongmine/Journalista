package kr.co.journalista.register;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.journalista.MemberVO;

@Repository
public class RegisterDAOImpl implements RegisterDAO{
	@Inject
	private SqlSession sql;
	
	private static String namespace = "kr.co.journalista.mappers.memberMapper";
	
	@Override
	public void register(MemberVO vo) throws Exception {
		System.out.println("회원등록완료");
		sql.insert(namespace + ".register", vo);
	}
}
