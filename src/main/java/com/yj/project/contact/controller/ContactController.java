package com.yj.project.contact.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller

public class ContactController {

	@RequestMapping("/contact.do")
	public String contact(HttpServletRequest req) {
		return "contact/contactForm";

}
}
