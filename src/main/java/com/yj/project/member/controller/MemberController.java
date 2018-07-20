package com.yj.project.member.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.yj.project.common.MemberException;
import com.yj.project.controller.MainPageController;
import com.yj.project.member.model.service.MemberService;
import com.yj.project.member.model.vo.Member;

@Controller

public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	   private BCryptPasswordEncoder bcrypt;
	   private Logger logger = Logger.getLogger(MemberController.class);
	
	   @RequestMapping("/member/memberEnroll.do")
		public String MemberEnroll() {
		   
			return "member/memberEnroll";
		}
		
		@RequestMapping("/member/memberEnrollEnd.do")
		public String MemberEnrollEnd(Member member, Model model,HttpServletRequest req,
				@RequestParam(value="member_phone1")String p1,@RequestParam(value="member_phone2")String p2,
				@RequestParam(value="member_phone3")String p3,@RequestParam(value="member_email1")String e1,
				@RequestParam(value="member_email2")String e2,@RequestParam(value="member_addr1")String add1,
				@RequestParam(value="member_addr2")String add2,@RequestParam(value="member_addr3")String add3
				,@RequestParam(value="member_level",required=false,defaultValue="일반")String level
				) {
			member.setMember_phone(p1+p2+p3);
			member.setMember_email(e1+e2);
			member.setMember_addr(add1+add2+add3);
			member.setMember_level(level);
			model.addAttribute("member",member);
		      String oripw=member.getMember_pw();
		      System.out.println("암호화 전 비번 : "+oripw);
		      member.setMember_pw(bcrypt.encode(oripw));
		      System.out.println("암호화 후 비번 : "+member.getMember_pw());
			int result=service.insertMember(member);
			
			String msg="";
			String loc="/";
			if(result>0) {
				msg="회원가입 성공";

			}else {
				msg="회원가입 실패";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			return "common/msg";
		}
			@RequestMapping("/member/memberLogin.do")
		   public String memberLogin(@RequestParam(value="member_id")String userId,@RequestParam(value="member_pw")String password, Model model,HttpSession session) {
			      logger.debug("로그인메소드 호출");
				  Member m=service.loginCheck(userId);
			      //응답페이지
			      String msg="";
			      String loc="/";
			      String view="/mainPage/mainPage";

			      if(m!=null) {
	/*		         if(m.getPassword().equals(password)) {
	*/		        	 if(bcrypt.matches(password, m.getMember_pw())) {
						
						msg="로그인 성공";
			            /*			Session!
						HttpSession 매개변수로 받아서 설정
						model 넣고서 어노테이션으로 설정
						@SessionAttribute(value= {키값})
						세션에 여러 값이 들어갈수 있기 때문에 배열로 선언되어 있음*/
						session.setAttribute("memberLoggedIn", m);
			        	 
			         } else {
			        	 try {
			        		 if(true) throw new RuntimeException("내가 발생");
			        		 
			        	 }catch(Exception e) {
			        		 logger.error("로그인 애러" + e);
			        		 throw new MemberException("로그인 에러 : " + e.getMessage());
			        	 }
			            msg="비밀번호가 일치하지 않습니다.";
			         }
			      } else {
			         msg="없는 아이디입니다.";
			      }
			      
			      model.addAttribute("msg",msg);
			      model.addAttribute("loc",loc);
			      return view;
			   }
			/*SessionStatus라는 객체의 isComplete() - 세션이 있는지 없는지 확인
			setComplete()로 세션을 삭제*/
			@RequestMapping("/member/memberLogout.do")
			public String logout(SessionStatus sessionStatus) {
				if(sessionStatus.isComplete())
				{
					sessionStatus.setComplete();
				}
				return "redirect:/";
			}
			
			@RequestMapping("/member/memberView.do")
			public String update(@RequestParam(value="userId") String userId,HttpServletRequest req) {
			    Member m=service.loginCheck(userId);
			    System.out.println(m.getEnroll_category());
			    List<String> hobbyList = Arrays.asList(m.getEnroll_category());
	/*		    for(int i=0;i<m.getHobby().length;i++) {
			    	hobbyList.add(m.getHobby()[i]);
			    }
	*/			req.setAttribute("m", m);
			    req.setAttribute("hobbyList", hobbyList);
				return "member/update";
			}
			
			@RequestMapping("/member/checkIdDuplicate.do")
			public void duplicateIdCheck(String userId,HttpServletRequest req,HttpServletResponse res) throws IOException {

				logger.debug("아이디 중복체크 : "+userId);
				
				boolean check=service.duplicateIdCheck(userId)==0?true:false;
				res.getWriter().print(check);
			}
	/*		@RequestMapping("/member/checkIdDuplicate1.do")
			public ModelAndView duplicateIdCheck1(String userId,ModelAndView mv) throws UnsupportedEncodingException {

				logger.debug("아이디 중복체크 : "+userId);
				Map map = new HashMap();
				boolean check=service.duplicateIdCheck(userId)==0?true:false;
				map.put("check", check);
				map.put("name",URLEncoder.encode("유병승","UTF-8"));
				mv.addObject("map",map);
				mv.setViewName("jsonView");
				
				return mv;
			}*/
			
			/*@RequestMapping("/member/checkIdDuplicate2.do")
			@ResponseBody
			public String duplicateIdCheck2(String userId,ModelAndView mv) throws UnsupportedEncodingException, JsonProcessingException {

				logger.debug("아이디 중복체크 : "+userId);
				Map map = new HashMap();
				ObjectMapper mapper = new ObjectMapper();
				
				
				boolean check=service.duplicateIdCheck(userId)==0?true:false;
				map.put("check", check);
				map.put("name",URLEncoder.encode("유병승","UTF-8"));
				mv.addObject("map",map);
				mv.setViewName("jsonView");
				
				String jsonstr=mapper.writeValueAsString(map);			
				return jsonstr;
			}*/
	   
}
