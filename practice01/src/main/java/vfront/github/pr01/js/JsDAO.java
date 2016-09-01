package vfront.github.pr01.js;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JsDAO {

	@Autowired
	private SqlSessionTemplate session;

	public JsMemberDTO idConf(String id) {
		return session.selectOne("js_mapper.idConf", id);
	}

	public int join(JsMemberDTO dto) {
		return session.insert("js_mapper.join", dto);
		
	}

	public JsMemberDTO tryLogin(JsMemberDTO dto) {
		return session.selectOne("js_mapper.tryLogin", dto);
		
	}
	
	
}
