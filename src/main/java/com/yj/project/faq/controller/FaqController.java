package com.yj.project.faq.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller

public class FaqController {

	@RequestMapping("/faq.do")
	public String faq(HttpServletRequest req) {
		return "faq/faq";

}
}
