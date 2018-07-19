package com.yj.project.second.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class SecondPageController {
	@RequestMapping("index.do")
	public String goIndex(@RequestParam(value="seq") String seq,HttpServletRequest req) {
		req.setAttribute("seq", seq);
		return "mainPage/mainPage";
	}
	@RequestMapping("secondPage.do")
	public String goSecond() {
		
		return "SecondPage/search";
	}
	@RequestMapping("/calendargo.do")
	public String goCalendar(HttpServletRequest req) {
		return "calendar/calendar";
	}
}
