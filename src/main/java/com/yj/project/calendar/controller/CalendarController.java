package com.yj.project.calendar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class CalendarController {

	@RequestMapping("/calendargo.do")
	public String goCalendar(HttpServletRequest req) {
		return "calendar/calendar";
	}
	
	@RequestMapping("/calendar.do")
	public String calendar(HttpServletRequest req) {
		System.out.println("dwqdqd");
		return "calendar/calendar";
		
	}
	
	
}
