package vfront.github.pr01.jh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
public class JhService extends DefaultTransactionDefinition{
	
	@Autowired
	JhRepository repository;
	
	@Autowired
	PlatformTransactionManager tx;
	
	TransactionStatus status;

	public int dosomething(JhDTO dto) {
		int res = repository.dosomething(dto);
		
		status = tx.getTransaction(this);
		if(res>0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		
		return res;
	}
	
	
	

}
