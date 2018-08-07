package com.yj.project.club.controller;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yj.project.board.controller.BoardController;
import com.yj.project.club.model.service.ClubService;
import com.yj.project.club.model.vo.Club;
import com.yj.project.member.model.vo.Member;

@Controller
public class ClubController {
	
	private Logger logger=LoggerFactory.getLogger(ClubController.class);
	
	@Autowired
	private ClubService clubService;
	//동아리 메인페이지로 넘어가는 로직
	@RequestMapping("clubMain.do")
	public String clubMain(String member_id, Model model) {
		Member member=clubService.selectOne(member_id);
		Club club=clubService.selectClub(member.getCircle1_num());
		System.out.println("동아리 정보"+club);		

		model.addAttribute("club",club);
		
		return "clubPage/clubMain";
	}
	//동아리 회원 관리 페이지로 가는 로직
	@RequestMapping("circle_list.do")
	public String CircleList(int circle_num, Model model) {
		List<Member> list=clubService.selectMember(circle_num);
		model.addAttribute("list",list);
		return "clubPage/clubMemberList";
	}
}
