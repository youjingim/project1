package com.yj.project.club.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String clubMain(String member_id, HttpSession session) {
		Member member=clubService.selectOne(member_id);
		Club club=clubService.selectClub(member.getCircle1_num());
		System.out.println("동아리 정보"+club);		

		session.setAttribute("club", club);
		
		return "clubPage/clubMain";
	}
	//동아리 회원 관리 페이지로 가는 로직
	@RequestMapping("circle_list.do")
	public String CircleList(int circle_num, Model model) {
		List<Member> list=clubService.selectMember(circle_num);
		model.addAttribute("list",list);
		return "clubPage/clubMemberList";
	}
	@RequestMapping("deleteMember.do")
	public String deleteMember(String id, Model model) {
		System.out.println("받은 아이디 값: "+id);
		/*String pw=memoService.selectNo(no);
		String msg="";
		String loc="/";
		String view="common/msg";
		if(pw.equals(password)) {
			int result = memoService.deleteMemo(no);
			if(result==1) {
				msg="삭제가 완료되었습니다";
			}
			else {
				msg="삭제를 실패하였습니다";
			}
		}
		else {
			msg="메모에 대한 비밀번호가 틀립니다";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "common/msg";*/
		return "";
	}
	//예산 페이지로 넘어가는 로직
	@RequestMapping("circle_budget.do")
	public String budget(int circle_num,  Model model) {
		System.out.println("예산 동아리 번호:"+circle_num);
		Club club=clubService.selectClub(circle_num);
		return "clubPage/clubBudget";
	}
	//갤러리 페이지로 넘어가는 로직
	@RequestMapping("circle_gallery.do")
	public String gallery(int circle_num,  Model model) {
		System.out.println("갤러리 동아리 번호:"+circle_num);
		Club club=clubService.selectClub(circle_num);
		return "clubPage/clubGallery";
	}
}
