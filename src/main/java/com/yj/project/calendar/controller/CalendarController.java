package com.yj.project.calendar.controller;




import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yj.project.calendar.model.service.MatchingService;
import com.yj.project.calendar.model.vo.Calendar;
import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
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
		for(Matching m : matchingList) {
			
		if(matching.getWithus_num()==m.getWithus_num() && (m.getMember_id().equals(matching.getReq_id()) || m.getReq_id().equals(matching.getReq_id()))) {
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

		if(matching.getReq_circle()==null) {
			matching.setReq_circle("c1");
		}
		
		String t1 = matching.getMatching_date().toString();
		String t2 = matching.getReq_matching_date().toString();
		boolean r = false;
		if(t1.equals(t2)) {
			r=true;
		}

		if(!r || !(matching.getTime1().equals(matching.getReq_time1())) || !(matching.getTime2().equals(matching.getReq_time2())) || !(matching.getWithus_place().equals(matching.getReq_withus_place()))) {
			matching.setStatus("C");
		}else {
			matching.setStatus("S");
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
	public String calendar(HttpServletRequest request,@RequestParam(value="category",required=false,defaultValue="전체")String category,HttpServletResponse response) {
		Cookie[] cookie=request.getCookies();
		String tCookieVal="tCheck";
		boolean tCheck = false;
		boolean hasRead=false;
		//사이트 방문시에는 아무런 쿠키를 
		//갖고있지 않으면 cookie값은 null이 나옴
		if(cookie!=null)
		{
			outter:
				for(Cookie c : cookie)
				{
					String name=c.getName();
					String value=c.getValue();
					
					if("tCheck".equals(name))
					{
						tCookieVal=value;
						if(value.contains("|"+"tCheck"+"|"))
						{
							hasRead=true;
							break outter;
						}
					}
				}
		}
		
		if(!hasRead)
		{

			tCheck = true;
			Cookie c=new Cookie("tCheck",tCookieVal+"|"+"tCheck"+"|");
			c.setMaxAge(-1);
			//브라우저가 닫는 경우 삭제
			response.addCookie(c);		
		}else {
			tCheck = false;
		}
		
		
		
		int result = service.updateDate();
		List<Calendar> list = service.selectList(category);
		List<Matching> matchingList = service.selectMatching();

		request.setAttribute("matchingList", matchingList);
		request.setAttribute("list", list);
		request.setAttribute("category",category );
		request.setAttribute("tCheck", tCheck);
		System.out.println(list);
		return "calendar/calendar";
		
	}
	@RequestMapping("/uploadMatching.do")
	public String uploadMatching(Calendar calendar, HttpServletRequest req,HttpSession session) {
		Member member = (Member)session.getAttribute("memberLoggedIn");
		if(calendar.getStatus()==null) {
			calendar.setStatus("S");
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
	
	@RequestMapping(value="/checkCalendar.do",method={RequestMethod.POST,RequestMethod.GET})
	public void matchingDate(@RequestParam(value="matchingDate")Date date,HttpServletResponse res,HttpServletRequest req) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();

		Member member = (Member)req.getSession().getAttribute("memberLoggedIn");
		map.put("member_id", member.getMember_id());
		map.put("date", date);
		//withus_board
		int result1 = service.selectDate(map);
		map2.put("circle_num", member.getCircle1_num());
		map2.put("date", date);
		//final
		int result2 = service.selectDate2(map2);
		//req_withus
		int result3 = service.selectDate3(map2);
		boolean check=false;

		
		
		if(result1>0 || result2>0 || result3>0) {
			check=true;
		}
		
		
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
	public void indexNum(@RequestParam(value="num") int num,
			@RequestParam(value="req_num")int req_num
			,HttpServletResponse res) throws IOException {
		res.setCharacterEncoding("UTF-8");
		List<Matching> m = service.selectMatching();
		
		
		Matching matching = new Matching();
		
		for(Matching m1 : m) {
			if(m1.getWithus_num() == num && Integer.parseInt(m1.getReq_circle()) == req_num) {
				matching = m1;
			}
		}
		
		
		
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(matching,res.getWriter());
		
	}
	@RequestMapping("/successMatching")
	public ModelAndView successMatching(Matching m,@RequestParam(value="matching_date") Date date
			,@RequestParam(value="re_time1",required=false,defaultValue="") String re_time11
			,@RequestParam(value="re_time2",required=false,defaultValue="") String re_time22
			,@RequestParam(value="re_place",required=false,defaultValue="") String req_withus_place1
			,@RequestParam(value="withus_content",required=false,defaultValue="") String req_withus_content1
			,@RequestParam(value="login_info") String id
			
			) {
		ModelAndView mv = new ModelAndView();
		String msg="";
		String loc="/clubMain.do?member_id="+id;
		m.setReq_matching_date(date);
		m.setReq_time1(re_time11);
		m.setReq_time2(re_time22);
		m.setReq_withus_place(req_withus_place1);
		m.setReq_withus_content(req_withus_content1);
		m.setMatching_date(date);
		
		FinalWithus finalWithus = new FinalWithus();
		
		finalWithus.setWithus_num(m.getWithus_num());
		finalWithus.setRegister_circle(m.getRegister_circle());
		finalWithus.setReq_circle(m.getReq_circle());
		finalWithus.setWithus_title(m.getWithus_title());
		finalWithus.setReq_withus_content(m.getReq_withus_content());
		finalWithus.setReq_matching_date(m.getReq_matching_date());
		finalWithus.setReq_matching_time(m.getReq_time1()+":00 ~ "+m.getReq_time2()+":00");
		finalWithus.setReq_withus_place(m.getReq_withus_place());
		finalWithus.setReq_member_id(m.getMember_id());
		ClubNotice notice = new ClubNotice();
		notice.setCircle_num(Integer.parseInt(m.getRegister_circle()));
		notice.setContent(m.getReq_matching_date()+" 에 신청된 매칭이 수락 되었습니다!");
		
		int result = service.successMatching(finalWithus);
		int result2 = service.noticeInsert(notice);
		int result3 = service.updateNotice(Integer.parseInt(m.getRegister_circle()),Integer.parseInt(m.getReq_circle()));
		if(result>0) {
			finalWithus.setRegister_circle(m.getReq_circle());
			finalWithus.setReq_circle(m.getRegister_circle());
			finalWithus.setReq_member_id(m.getReq_member_id());
			result = service.successMatching(finalWithus);
			result2 = service.chageState(m.getWithus_num());
			notice.setCircle_num(Integer.parseInt(m.getReq_circle()));
			result3 = service.noticeInsert(notice);
			
		}
		if(result>0 && result2>0 && result3>0) {
			msg="매칭이 등록 되었습니다!";
		}else {
			msg="매칭이 등록을 실패하였습니다!";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		
		
		return mv;
	}
	
	@RequestMapping("/failMatching")
	public ModelAndView fail(Matching m,@RequestParam(value="withus_num")int withus_num,@RequestParam(value="register_circle")int circle_num,@RequestParam(value="login_info")String id) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		String msg="";
		String loc="/clubMain.do?member_id="+id;
		ClubNotice notice = new ClubNotice();
		notice.setCircle_num(Integer.parseInt(m.getRegister_circle()));
		notice.setContent(m.getMatching_date()+" 에 신청된 매칭이 거절 되었습니다!");
		map.put("withus_num", withus_num);
		map.put("circle_num", circle_num);
		
		int result = service.failMatching(map);
		int result2 = service.noticeInsert(notice);
		int result3 = service.updateNotice(Integer.parseInt(m.getRegister_circle()),Integer.parseInt(m.getReq_circle()));
		notice.setCircle_num(Integer.parseInt(m.getReq_circle()));
		result3 = service.noticeInsert(notice);
		if(result>0) {
			msg="매칭신청을 거절하셨습니다.";
		}else {
			msg="매칭신청 거절 실패!";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}

	
	
	
}
