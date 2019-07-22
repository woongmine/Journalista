package kr.co.journalista.register;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.journalista.MemberVO;

@Repository
public class RegisterDAOImpl implements RegisterDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);

	@Inject
	private SqlSession sql;
	
	private static String namespace = "kr.co.journalista.mappers.memberMapper";
	
	@Override
	public void register(MemberVO vo) throws Exception {
		logger.info("dao "+vo);

		System.out.println("회원등록완료");
		sql.insert(namespace + ".register", vo);
	}

	@Override
	public int emailCheck(String email) throws Exception {
		int emailCount = sql.selectOne(namespace + ".emailCheck", email);
		return emailCount;
	}
	
	@Override
	public void createAuthKey(String email, String email_key) throws Exception {
		// TODO Auto-generated method stub
		MemberVO vo = new MemberVO();
		vo.setEmail_key(email_key);
		vo.setEmail(email);

		sql.selectOne(namespace + ".createAuthKey", vo);
	}
	
	@Override
	public void userAuth(String email) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".userAuth", email);
	}
}
