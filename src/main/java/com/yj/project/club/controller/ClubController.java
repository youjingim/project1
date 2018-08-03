package com.yj.project.club.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yj.project.board.controller.BoardController;
import com.yj.project.club.model.service.ClubService;

@Controller
public class ClubController {
	
	private Logger logger=LoggerFactory.getLogger(ClubController.class);
	
	@Autowired
	private ClubService clubService;
	
	@RequestMapping("clubMain.do")
	public String clubMain() {
		return "clubPage/clubMain";
	}
	
}
