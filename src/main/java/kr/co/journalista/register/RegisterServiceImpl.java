package kr.co.journalista.register;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.journalista.MemberVO;

@Service
public class RegisterServiceImpl  implements RegisterService{
	
	@Inject
	RegisterDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

}
