package vfront.github.pr01.jh;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@RequestMapping("/jh")
@Controller
public class JhController {
	
	
	@Autowired
	JhService service;
	
	
	@RequestMapping("/dosomething")
	public void dosomething(JhDTO dto, HttpServletResponse response) throws IOException{
		System.out.println("asdf");
		int res = service.dosomething(dto);
		
		PrintWriter pw = response.getWriter();
		if(res>0){
			pw.write("1");
		}else{
			pw.write("0");
		}
		pw.flush();
	}
	
	

}
