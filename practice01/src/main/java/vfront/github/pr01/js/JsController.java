package vfront.github.pr01.js;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/js")
@Controller
public class JsController {

	@RequestMapping("/")
	public ModelAndView front(){
		System.out.println("js's controller");
		
		
		return null;
	}
	
}
