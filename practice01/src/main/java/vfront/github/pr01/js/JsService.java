package vfront.github.pr01.js;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
public class JsService extends DefaultTransactionDefinition{
	
	private TransactionStatus status;
	@Autowired
	private PlatformTransactionManager tx;
	
	@Autowired
	private JsDAO dao;
	
	public String idConf(String id) {
		
		JsMemberDTO dto  = dao.idConf(id);
		String msg = "사용가능한 아이디";
		
		if(dto != null){
			msg = "중복된 아이디";
		}
		
		return msg;
	}

	public String join(HttpServletRequest request) {
		JsMemberDTO dto = new JsMemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		
		status = tx.getTransaction(this);
		
		int res = dao.join(dto);
		String msg = "실패";
		
		if(res>0){
			msg = "회원가입완료";
			tx.commit(status);
		}else tx.rollback(status);
		
		
		
		return msg;
	}

	public String tryLogin(HttpServletRequest request, HttpSession session) {
		JsMemberDTO dto = new JsMemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
		JsMemberDTO loginDTO = dao.tryLogin(dto);
		String msg = "로그인되었습니다";
		if(loginDTO!=null){
			session.setAttribute("nowLogin", loginDTO.getId());
			
		}else{
			msg = "로그인 실패";
		}
		
		
		
		return msg;
	}
	
	
	

	
}
