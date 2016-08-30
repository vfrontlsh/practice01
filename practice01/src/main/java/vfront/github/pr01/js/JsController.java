package vfront.github.pr01.js;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/js")
@Controller
public class JsController {

	@Autowired
	private JsService service;
	
	
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
	
	@RequestMapping(value="/idConf", produces="text/plain; charset=utf-8")
	@ResponseBody
	public String idConf(@RequestParam(value="id") String id){
		
		String msg = service.idConf(id);
		System.out.println(msg);
		return msg;
	}
	
	@RequestMapping("/join")
	public ModelAndView join(HttpServletRequest request){
		
		String msg = service.join(request);
		ModelAndView mav = new ModelAndView("forward:/js/");
		mav.addObject("msg", msg);
		
		return mav;
	}
	
	@RequestMapping("/tryLogin")
	public ModelAndView tryLogin(HttpServletRequest request, HttpSession session){
		
		String msg = service.tryLogin(request, session);
		ModelAndView mav = new ModelAndView("forward:/js/");
		mav.addObject("msg", msg);
		
		return mav;
		
	}
	
	@RequestMapping("/ng")
	public String ng(){
		return "/js/angularTest";
	}
}
