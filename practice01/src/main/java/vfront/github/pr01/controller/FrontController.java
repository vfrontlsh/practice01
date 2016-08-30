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
	 * 媛곸옄 蹂몄씤 �뙣�궎吏� 留뚮뱶�떆怨� 
	 * 
		�궇�씪�삩 蹂몄씤 �씠�땲�뀥 �뙆�씪誘명꽣 if �젅�뿉�꽌 
		ModelAndView�뿉 
		蹂몄씤 controller濡� 
		forward �샊�� redirect �븯�떆硫� �맗�땲�떎
		
	*/
		if(cmd.equals("js")){
			mav.setViewName("forward:/js/");
			
		}else if(cmd.equals("jh")){
			
		}else if(cmd.equals("dh")){
			
			mav.setViewName("forward:/dh/");
			
		}else if(cmd.equals("sy")){
			
		}else if(cmd.equals("sh")){
			
		}
		
		
		return mav;
	}
	
}
