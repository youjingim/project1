package com.yj.project.calendar.controller;


import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yj.project.calendar.model.service.MatchingService;
import com.yj.project.calendar.model.vo.Calendar;
@Controller
public class CalendarController {
	@Autowired
	MatchingService service;
	
	@RequestMapping("/send_Matching.do")
	public String goCalendar() {
		
		return "calendar/calendar";
	}
	
	@RequestMapping("/calendar.do")
	public String calendar(HttpServletRequest req) {
		return "calendar/calendar";
		
	}
	@RequestMapping("/uploadMatching.do")
	public String uploadMatching(Calendar calendar, HttpServletRequest req) {
		int result = service.uploadMatching(calendar);
		String msg="";
		String loc="calendar/calendar";
		if(result>0) {
			msg="업로드 성공!";
		}else {
			msg="업로드 실패!";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "common/msg";
	}
	
	
}
