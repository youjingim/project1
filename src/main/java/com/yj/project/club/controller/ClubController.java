package com.yj.project.club.controller;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;


import com.yj.project.common.page.CirclePageCreate;
import com.yj.project.board.controller.BoardController;
import com.yj.project.board.model.vo.Board;
import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.service.ClubService;
import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.CB_Comment;
import com.yj.project.club.model.vo.Circle_board;
import com.yj.project.club.model.vo.Club;
import com.yj.project.member.model.vo.Member;

@Controller
public class ClubController {
	
	private Logger logger=LoggerFactory.getLogger(ClubController.class);
	
	@Autowired
	private ClubService clubService;
	
	//동아리 메인페이지로 넘어가는 로직
	@RequestMapping("clubMain.do")
	public String clubMain(String member_id, HttpSession session, Model model) {
		Member member=clubService.selectOne(member_id);
		Club club=clubService.selectClub(member.getCircle1_num());
		List<Matching> matching = clubService.selectMatching(member.getCircle1_num());
	    System.out.println("동아리 정보"+club);
	    session.setAttribute("matching", matching);
		String[] array=club.getCategory().split(",");
		
		List<Circle_board> list=clubService.selectBoardList(club.getCircle_num());
		List<CB_Comment> clist=clubService.commentList(club.getCircle_num());
		session.setAttribute("member", member);
		session.setAttribute("club", club);
		session.setAttribute("BoardList", list);
		session.setAttribute("array", array);
		session.setAttribute("clist", clist);
		return "clubPage/clubMain";
	}
	//동아리 회원 관리 페이지로 가는 로직
	@RequestMapping("circle_list.do")
	public ModelAndView CircleList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,int circle_num) {
		ModelAndView mv = new ModelAndView();
		int numPerPage=10;
		List<Member> list=clubService.selectMember(circle_num,cPage,numPerPage);
		int totalCount=clubService.selectMemberCount(circle_num);
		System.out.println("동아리 회원 수 :"+totalCount);
		String pageBar=new CirclePageCreate().getPageBar(cPage,numPerPage,totalCount,"circle_list.do",circle_num);
		mv.addObject("pageBar",pageBar);
		mv.addObject("list",list);
		mv.addObject("cPage",cPage);
		mv.addObject("totalCount",totalCount);
		mv.setViewName("clubPage/clubMemberList");
		
		return mv;
	}
	//예산 페이지로 넘어가는 로직
	@RequestMapping("circle_budget.do")
	public ModelAndView budget(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, int circle_num, String id) {
		ModelAndView mv = new ModelAndView();
		System.out.println("예산 동아리 번호:"+circle_num);
		System.out.println("로그인 한 회원 : "+id);
		Club club=clubService.selectClub(circle_num);
		int numPerPage=10;
		List<Budget> list=clubService.selectBudgetList(circle_num,cPage,numPerPage);
		int totalCount=clubService.selectCountBudget(circle_num);
		String pageBar=new CirclePageCreate().getPageBar(cPage,numPerPage,totalCount,"circle_budget.do",circle_num);

		mv.addObject("club", club);
		mv.addObject("member_id", id);
		mv.addObject("pageBar",pageBar);
		mv.addObject("list",list);
		mv.addObject("cPage",cPage);
		mv.addObject("totalCount",totalCount);
		mv.setViewName("clubPage/clubBudget");
		return mv;
	}
	
	//갤러리 페이지로 넘어가는 로직
	@RequestMapping("circle_gallery.do")
	public String gallery(int circle_num,  Model model) {
		System.out.println("갤러리 동아리 번호:"+circle_num);
		Club club=clubService.selectClub(circle_num);
		return "clubPage/clubGallery";
	}

	//동아리 게시글 작성 로직
	@RequestMapping("clubMainPage.do")
	public ModelAndView insertCBoard(Circle_board cb) {
		ModelAndView mv=new ModelAndView();
		if(cb.getCb_attachment()==null) {
			cb.setCb_attachment("notFoundFile");
		}
		if(cb.getCb_attachment2()==null) {
			cb.setCb_attachment2("notFoundFile");
		}
		int result=clubService.insertBoard(cb);
		
		String msg="";
		if(result>0) {
			msg="등록을 성공하였습니다";
		}
		else {
			msg="등록에 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "clubMain.do?member_id="+cb.getMember_id());
		
		mv.setViewName("common/msg");
		return mv;
	}
	//동아리 게시글 삭제 로직
	@RequestMapping("deleteCircle_board.do")
	public ModelAndView deleteCBoard(int no,String id) {
		ModelAndView mv=new ModelAndView();
		System.out.println("삭제할 게시글 번호 : "+no);
		System.out.println("로그인 된 회원의 아이디 : "+id);
		int result=clubService.deleteBoard(no);
		System.out.println("게시글 삭제 결과 : "+result);
		
		String msg="";
		if(result>0) {
			msg="게시글 삭제를 성공하였습니다";
		}
		else {
			msg="삭제를 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "clubMain.do?member_id="+id);
		
		mv.setViewName("common/msg");
		return mv;
		
	}
	//게시글 수정 페이지로 넘기는 로직
	@RequestMapping("updateCircle_board.do")
	public String updateCBoard(int no,Model model) {
		System.out.println("수정할 게시글 번호 : "+no);
		Circle_board c=clubService.selectBoardOne(no);
		System.out.println("수정할 게시글 정보 : "+c);
		model.addAttribute("c", c);
		return "clubPage/clubMainUpdateForm";			
	}
	//게시글 수정 마지막 로직
	@RequestMapping("clubMainUpdateBoardEnd.do")
	public ModelAndView updateCBoardEnd(Circle_board cb) {
		ModelAndView mv=new ModelAndView();

		int result=clubService.updateBoard(cb);
		System.out.println("게시글 수정 결과 : "+result);
		
		String msg="";
		if(result>0) {
			msg="게시글 수정 성공하였습니다";
		}
		else {
			msg="수정을 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "clubMain.do?member_id="+cb.getMember_id());
		
		mv.setViewName("common/msg");
		return mv;
		
	}
	//회원목록에서 동아리 회원 탈퇴시키는 로직
	@RequestMapping("deleteCircleMember.do")
	public ModelAndView deleteCircleMember(String id, int no) {
		ModelAndView mv=new ModelAndView();
		
		int result=clubService.deleteCircleMember(id);
		
		String msg="";
		if(result>0) {
			msg="동아리 회원탈퇴를 성공하였습니다";
		}
		else {
			msg="회원탈퇴를 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "circle_list.do?circle_num="+no);
		
		mv.setViewName("common/msg");
		return mv;
	}
	//예산입력 로직
	@RequestMapping("insert_budget.do")
	public ModelAndView insertBudget(Budget b) {
		ModelAndView mv=new ModelAndView();
			
		int result=clubService.insertBudget(b);
		System.out.println("예산입력결과 : "+result);
		String msg="";
		if(result>0) {
			msg="예산입력에 성공하였습니다";
		}
		else {
			msg="예산입력을 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "circle_budget.do?circle_num="+b.getCircle_num());
		
		mv.setViewName("common/msg");
		return mv;
	}
	//게시글 댓글 작성 로직
	@RequestMapping("insertComment.do")
	@ResponseBody
	public String insertComment(int no, String comment,String memberId,Model model) {
		ModelAndView mv=new ModelAndView();
		System.out.println(no);
		System.out.println(comment);
		System.out.println(memberId);
		CB_Comment c=new CB_Comment();
		c.setMember_id(memberId);
		c.setCb_comment_content(comment);
		c.setCb_num(no);
		int result=clubService.insertComment(c);
	
		System.out.println(result);

		
		
		return "clubPage/commentAjax";
	}

}
