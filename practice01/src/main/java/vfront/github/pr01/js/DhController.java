package vfront.github.pr01.js;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dh")
public class DhController {
	
	private final String homeView = 
			"dh/dhHome";
	@RequestMapping("/")
	public String goHome(){
		return homeView;
	}
	
	

}
