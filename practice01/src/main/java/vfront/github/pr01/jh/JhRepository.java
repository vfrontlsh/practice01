package vfront.github.pr01.jh;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JhRepository {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int dosomething(JhDTO dto) {
		return sqlSessionTemplate.insert("jhmapper.dosomething", dto);
	}
	
	
	

}
