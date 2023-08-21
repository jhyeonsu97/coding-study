package egov.mywork1.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/index.do")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "main/main";
	}
}





