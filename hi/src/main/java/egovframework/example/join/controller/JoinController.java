package egovframework.example.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {

	@RequestMapping("/joinRegister.do")
	public String joinRegister() {
		
		return "join/joinMbrInput";
	}
}
