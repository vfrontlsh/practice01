package vfront.github.pr01.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/front")
@Controller
public class FrontController {

	
	@RequestMapping("/")
	public ModelAndView front(HttpServletRequest request){
		
		String cmd = request.getParameter("cmd");
		
		System.out.println(cmd);
		
		ModelAndView mav = new ModelAndView();
	/*
	 * 
	 * 각자 본인 패키지 만드시고 
	 * 
		날라온 본인 이니셜 파라미터 if 절에서 
		ModelAndView에 
		본인 controller로 
		forward 혹은 redirect 하시면 됩니다
		
	*/
		if(cmd.equals("js")){
			mav.setViewName("forward:/js/");
			
		}else if(cmd.equals("jh")){
			mav.setViewName("/jh/yohanhome");
		}else if(cmd.equals("dh")){
			
		}else if(cmd.equals("sy")){
			
		}else if(cmd.equals("sh")){
			
		}
		
		
		return mav;
	}
	
}
