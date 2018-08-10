package com.yj.project.calendar.controller;




import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yj.project.calendar.model.service.MatchingService;
import com.yj.project.calendar.model.vo.Calendar;
import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.member.model.vo.Member;
@Controller
public class CalendarController {
	@Autowired
	MatchingService service;
	
	@RequestMapping("/send_Matching.do")
	public String goCalendar(HttpServletRequest req,HttpSession session,Matching matching,@RequestParam(value="matching_date1") long date
			,@RequestParam(value="req_matching_date1",required=false,defaultValue="2000-01-01") Date req_matching_date1
			,@RequestParam(value="re_time11",required=false,defaultValue="") String re_time11
			,@RequestParam(value="re_time22",required=false,defaultValue="") String re_time22
			,@RequestParam(value="req_withus_place1",required=false,defaultValue="") String req_withus_place1
			,@RequestParam(value="req_withus_content1",required=false,defaultValue="") String req_withus_content1) {
		List<Matching> matchingList = service.selectMatching();
		String msg="";
		String loc="/calendar.do";
		System.out.println(matchingList);
		for(Matching m : matchingList) {
			
		if(matching.getWithus_num()==m.getWithus_num()) {
			msg="이미 신청한 매칭입니다.";
			req.setAttribute("msg",msg);
			req.setAttribute("loc", loc);
			return "common/msg";
		}
		}
		
		Member member = (Member)session.getAttribute("memberLoggedIn");
		matching.setReq_id(member.getMember_id());
		matching.setReq_matching_date(req_matching_date1);
		matching.setReq_time1(re_time11);
		matching.setReq_time2(re_time22);
		matching.setReq_withus_place(req_withus_place1);
		matching.setReq_withus_content(req_withus_content1);
		Date d = new Date(date);
		matching.setMatching_date(d);
		if(matching.getStatus()==null) {
			matching.setStatus("S");
		}
		if(matching.getReq_circle()==null) {
			matching.setReq_circle("c1");
		}
		int result = service.requestMatching(matching);

		if(result>0) {
			msg="매칭 신청 성공!";
		}else {
			msg="매칭 신청 실패!";
		}
		req.setAttribute("msg",msg);
		req.setAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/calendar.do")
	public String calendar(HttpServletRequest req,@RequestParam(value="category",required=false,defaultValue="전체")String category) {
		
		List<Calendar> list = service.selectList(category);
		

		req.setAttribute("list", list);
		req.setAttribute("category",category );
		System.out.println(list);
		return "calendar/calendar";
		
	}
	@RequestMapping("/uploadMatching.do")
	public String uploadMatching(Calendar calendar, HttpServletRequest req,HttpSession session) {
		Member member = (Member)session.getAttribute("memberLoggedIn");
		if(calendar.getStatus()==null) {
			calendar.setStatus("N");
		}
		if(calendar.getWithus_category()==null) {
			calendar.setWithus_category("전체");
		}

		

		calendar.setMember_id(member.getMember_id());
		System.out.println(calendar);
		int result = service.uploadMatching(calendar);
		String msg="";
		String loc="/calendar.do";
		if(result>0) {
			msg="업로드 성공!";
		}else {
			msg="업로드 실패!";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/checkCalendar")
	public void matchingDate(@RequestParam(value="matchingDate")Date date,HttpServletResponse res,HttpServletRequest req) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		Member member = (Member)req.getSession().getAttribute("memberLoggedIn");
		map.put("member_id", member.getMember_id());
		map.put("date", date);
		boolean check = service.selectDate(map)==0?true:false;
		
		res.getWriter().print(check);
	}
	@RequestMapping("/delete_Matching.do")
	public String delete_Matching(@RequestParam(value="withus_num") int num,HttpServletRequest req) {
		int result = service.deleteMatching(num);
		String msg="";
		String loc="/calendar.do";
		if(result>0) {
			msg ="삭제 성공!";
		}else {
			msg = "삭제 실패!";
		}
		req.setAttribute("loc", loc);
		req.setAttribute("msg", msg);
		
		return "common/msg";
	}
	@RequestMapping("/clubPage.do")
	public String move() {
		return "clubPage/club";
	}
	
	@RequestMapping("/indexCheck.do")
	public void indexNum(@RequestParam(value="num") int num,HttpServletResponse res) throws IOException {
		res.setCharacterEncoding("UTF-8");
		List<Matching> m = service.selectMatching();
		
		SimpleDateFormat st = new SimpleDateFormat("yyyy-MM-dd");
		
		Matching matching = m.get(num);
		
		System.out.println(matching.getMatching_date());
		
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(matching,res.getWriter());
		
	}
	
	
}
