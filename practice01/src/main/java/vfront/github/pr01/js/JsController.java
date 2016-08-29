package vfront.github.pr01.js;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/js")
@Controller
public class JsController {

	@RequestMapping("/")
	public ModelAndView front(){
		System.out.println("js's controller");
		
		ModelAndView mav = new ModelAndView("/js/boardHome");
		
		
		return mav;
	}
	
	
	@RequestMapping("/joinForm")
	public ModelAndView joinForm(){
		
		return new ModelAndView("/js/tryJoin");
	}
	
	@RequestMapping("/idConf")
	@ResponseBody
	public String idConf(){
		return null;
	}
	
}
