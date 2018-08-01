package com.yj.project.member.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
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
				,@RequestParam(value="member_level",required=false,defaultValue="L2")String level
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
		   
		      System.out.println("이거"+member.getUniversity());
			int result=service.insertMember(member);
			
			String msg="";
			String loc="/";
			if(result>0) {
				msg="축하드립니다 ! 가입 완료되었습니다 !";
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
			}else {
				msg="회원가입 실패";
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
			}
			return "common/msg";
		}
		@RequestMapping("/member/memberLogin.do")
        public String memberLogin(@RequestParam(value="member_id")String userId,@RequestParam(value="member_pw")String password, Model model,HttpSession session) {
              logger.debug("로그인메소드 호출");
             Member m=service.loginCheck(userId);
              //응답페이지
              String msg="";
              String loc="/";
              String view="/common/msg";

              if(m!=null) {
  /*               if(m.getPassword().equals(password)) {
  */                  if(bcrypt.matches(password, m.getMember_pw())) {
                 
                    /*         Session!
                 HttpSession 매개변수로 받아서 설정
                 model 넣고서 어노테이션으로 설정
                 @SessionAttribute(value= {키값})
                 세션에 여러 값이 들어갈수 있기 때문에 배열로 선언되어 있음*/
                 session.setAttribute("memberLoggedIn", m);
                 return "mainPage/mainPage";
  				} else {
                    msg="비밀번호가 일치하지 않습니다.";
                 }
              } else {
                 msg="없는 아이디입니다.";
              }
              
              model.addAttribute("msg",msg);
              model.addAttribute("loc",loc);
              return "common/msg";
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
			public void duplicateIdCheck(String member_id,HttpServletRequest req,HttpServletResponse res) throws IOException {

				logger.debug("아이디 중복체크 : "+member_id);
				
				boolean check=service.duplicateIdCheck(member_id)==0?true:false;
				res.getWriter().print(check);
			}
			
			@RequestMapping("/member/findId.do")
			public void findId(HttpServletRequest req, HttpServletResponse res,
									@RequestParam(value="fid_name")String fid_name, 
									@RequestParam(value="member_email1")String e1,
									@RequestParam(value="member_email2")String e2) throws IOException {
				String fid_email=e1+e2;
				Map<String, String> map = new HashMap<String, String>();
				String msg="";
				String loc="/";
		  		map.put("fid_name", fid_name);
		  		map.put("fid_email", fid_email);
				String fid=service.findId(map);
				int idlength=fid.length();
				//eeun95 6개
				int showid=idlength-2;
				String id=fid.substring(0, showid)+"**";
				if(id==null) {
					msg="null";
					res.getWriter().print(msg);
				}else {
				res.getWriter().print(id);
				}

			}
			@RequestMapping("/member/findPw.do")
			public String findId(HttpServletRequest req, 
									@RequestParam(value="fpw_id")String fpw_id, 
									@RequestParam(value="fpw_name")String fpw_name, 
									@RequestParam(value="member_email1")String e1,
									@RequestParam(value="member_email2")String e2) {
				String fpw_email=e1+e2;
				Map<String, String> map = new HashMap<String, String>();
				String msg="";
				String loc="/";
				map.put("fpw_id", fpw_id);
		  		map.put("fpw_name", fpw_name);
		  		map.put("fpw_email", fpw_email);
		   		String pw=service.findPw(map);
				
				int resultEmail=service.selectEmail(map);
				int resultId=service.selectId(map);
				if(resultEmail==0) {
					msg="회원 이메일이 존재하지 않습니다.";
					req.setAttribute("msg", msg);
		   			req.setAttribute("loc", loc);
					return "common/msg";
				} else if(resultId==0) {
					msg="아이디나 이름이 존재하지 않습니다.";
					req.setAttribute("msg", msg);
		   			req.setAttribute("loc", loc);
					return "common/msg";
				}
				
				System.out.println("비번찾기 결과 : "+pw);
				req.setAttribute("member_pw", pw);
				return "member/findPw";
			}
			@RequestMapping("/member/emailAuth")
			public String emailCheck(	HttpServletRequest req,
									@RequestParam(value="member_id" ,required=false)String member_id, 
									@RequestParam(value="email" ,required=false)String email) {

			   	  System.out.println(member_id);
		          System.out.println(email);
		          String authNum="";
		          
		          StringBuffer buffer = new StringBuffer();
		          for(int i=0;i<=6;i++) {
		             int n = (int)(Math.random()*10);
		             buffer.append(n);
		          }
		          
		          
		          authNum= buffer.toString();

		          sendEmail(email.toString(),authNum);
		          
		          req.setAttribute("email", email);
		          req.setAttribute("authNum", authNum);
		          return "member/emailAuth";
			}
			private void sendEmail(String email,String authNum) {
			      String host="smtp.gmail.com";
			      String subject="안녕하세요 CAMPUS PICK 인증번호 메일입니다 :-)";
			      String fromName="CAMPUS PICK 운영자";
			      String from="CAMPUSPICK";
			      String to1=email;
			      
			      String content="인증번호["+authNum+"]를 회원가입 창에 입력해주세요!";
			      
			      try {
			         Properties props= new Properties();
			         
			         props.put("mail.smtp.starttls.enable","true");
			         props.put("mail.transport.protocol", "smtp");
			         props.put("mail.smtp.host", host);
			         props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			         props.put("mail.smtp.port", "465");
			         props.put("mail.smtp.user", from);
			         props.put("mail.smtp.auth", "true");
			         
			         Session mailSession=Session.getInstance(props,
			               new javax.mail.Authenticator() {
			                  protected PasswordAuthentication getPasswordAuthentication() {
			                     return new PasswordAuthentication("ppj1017@gmail.com", "ahfmrqhd1!a");
			                  }
			         });
			         Message msg= new MimeMessage(mailSession);
			         msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B")));
			         InternetAddress[] address1= {new InternetAddress(to1)};
			         
			         msg.setRecipients(Message.RecipientType.TO, address1);
			         msg.setSubject(subject);
			         msg.setSentDate(new java.util.Date());
			         msg.setContent(content,"text/html;charset=euc-kr");
			         
			         Transport.send(msg);
			   
			      }catch(MessagingException e) {
			         e.printStackTrace();
			      }catch(Exception e) {
			         e.printStackTrace();
			      }
			   }
			
}
