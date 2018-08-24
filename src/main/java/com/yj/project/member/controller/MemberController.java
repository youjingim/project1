package com.yj.project.member.controller;

import java.io.IOException;
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
import org.springframework.web.servlet.ModelAndView;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.yj.project.common.page.PageCreate; 
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
	public String MemberEnrollEnd(Member member, Model model, HttpServletRequest req,
			@RequestParam(value = "member_phone1") String p1, @RequestParam(value = "member_phone2") String p2,
			@RequestParam(value = "member_phone3") String p3, @RequestParam(value = "member_email1") String e1,
			@RequestParam(value = "member_email2") String e2, @RequestParam(value = "member_addr1") String add1,
			@RequestParam(value = "member_addr2") String add2, @RequestParam(value = "member_addr3") String add3,
			@RequestParam(value = "member_level", required = false, defaultValue = "L2") String level) {
		System.out.println("취미:" + member.getEnroll_category());
		member.setMember_phone(p1 + p2 + p3);
		member.setMember_email(e1 + "@" + e2);
		member.setMember_addr(add1 + add2+ add3);
		member.setMember_level(level);
		model.addAttribute("member", member);
		String oripw = member.getMember_pw();
		System.out.println("암호화 전 비번 : " + oripw);
		member.setMember_pw(bcrypt.encode(oripw));
		System.out.println("암호화 후 비번 : " + member.getMember_pw());
		member.setMember_notice(0);
		int result = service.insertMember(member);

		String msg = "";
		String loc = "/";
		if (result > 0) {
			msg = "축하드립니다 ! 가입 완료되었습니다 !";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
		} else {
			msg = "회원가입 실패";
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
		}
		return "common/msg";
	}

	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(@RequestParam(value = "member_id") String userId,
			@RequestParam(value = "member_pw") String password, Model model, HttpSession session) {
		logger.debug("로그인메소드 호출");
		Member m = service.loginCheck(userId);
		// 응답페이지
		String msg = "";
		String loc = "/";
		String view = "/common/msg";
		if (m != null) {
			/*
			 * if(m.getPassword().equals(password)) {
			 */ if (bcrypt.matches(password, m.getMember_pw())) {

				/*
				 * Session! HttpSession 매개변수로 받아서 설정 model 넣고서 어노테이션으로 설정
				 * 
				 * @SessionAttribute(value= {키값}) 세션에 여러 값이 들어갈수 있기 때문에 배열로 선언되어 있음
				 */
				session.setAttribute("memberLoggedIn", m);
				return "mainPage/mainPage";
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		} else {
			msg = "없는 아이디입니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}

	/*
	 * SessionStatus라는 객체의 isComplete() - 세션이 있는지 없는지 확인 setComplete()로 세션을 삭제
	 */
	@RequestMapping("/member/memberLogout.do")
	public String logout(SessionStatus sessionStatus) {
		if (sessionStatus.isComplete()) {
			sessionStatus.setComplete();
		}
		return "redirect:/";
	}

	/*
	 * @RequestMapping("/member/memberView.do") public String
	 * update(@RequestParam(value = "userId") String userId, HttpServletRequest req)
	 * { Member m = service.loginCheck(userId);
	 * System.out.println(m.getEnroll_category()); List<String> hobbyList =
	 * Arrays.asList(m.getEnroll_category());
	 * 
	 * for (int i = 0; i < m.getHobby().length; i++) {
	 * hobbyList.add(m.getHobby()[i]); } req.setAttribute("m", m);
	 * req.setAttribute("hobbyList", hobbyList); return "member/update"; }
	 */

	@RequestMapping("/member/checkIdDuplicate.do")
	public void duplicateIdCheck(String member_id, HttpServletRequest req, HttpServletResponse res) throws IOException {

		logger.debug("아이디 중복체크 : " + member_id);

		boolean check = service.duplicateIdCheck(member_id) == 0 ? true : false;
		res.getWriter().print(check);
	}

	@RequestMapping("/member/checkEmail.do")
	public void checkEmail(HttpServletRequest req, HttpServletResponse res,
			@RequestParam(value = "member_name") String member_name, @RequestParam(value = "member_email1") String e1,
			@RequestParam(value = "member_email2") String e2) throws IOException {
		System.out.println("이메일2:"+e2);
		String email = e1 + "@" + e2;
		int result = service.checkEmail(email);
		if(result>0) {
			System.out.println("중복");
		} else {
			System.out.println("가능");
		}
		res.getWriter().print(result);
	}

	@RequestMapping("/member/findId.do")
	public void findId(HttpServletRequest req, HttpServletResponse res,
			@RequestParam(value = "fid_name") String fid_name, @RequestParam(value = "member_email1") String e1,
			@RequestParam(value = "member_email2") String e2) throws IOException {
		int idlength;
		String fid_email = e1 + "@" + e2;
		Map<String, String> map = new HashMap<String, String>();
		String msg = "";
		String loc = "/";
		map.put("fid_name", fid_name);
		map.put("fid_email", fid_email);
		String fid = service.findId(map);
		System.out.println("여기" +fid);
		if (fid == null) {
			msg = "null";
			res.getWriter().print(msg);
		} else {
			idlength = fid.length();
			// eeun95 6개
			int showid = idlength - 2;
			String id = fid.substring(0, showid) + "**";
			res.getWriter().print(id);
		}

	}

	@RequestMapping("/member/findPw.do")
	public String findId(HttpServletRequest req, @RequestParam(value = "fpw_id") String fpw_id,
			@RequestParam(value = "fpw_name") String fpw_name, @RequestParam(value = "member_email1") String e1,
			@RequestParam(value = "member_email2") String e2) {
		String fpw_email = e1 + "@" + e2;
		Map<String, String> map = new HashMap<String, String>();
		String msg = "";
		String loc = "/";
		map.put("fpw_id", fpw_id);
		map.put("fpw_name", fpw_name);
		map.put("fpw_email", fpw_email);
		String pw = service.findPw(map);

		int resultEmail = service.selectEmail(map);
		int resultId = service.selectId(map);
		if (resultEmail == 0) {
			msg = "회원 이메일이 존재하지 않습니다.";

		} else if (resultId == 0) {
			msg = "아이디나 이름이 존재하지 않습니다.";

		} else {
			String newpw = "@";
			for (int i = 0; i < 8; i++) {
				int rndVal = (int) (Math.random() * 62);
				if (rndVal < 10) {
					newpw += rndVal;
				} else if (rndVal > 35) {
					newpw += (char) (rndVal + 61);
				} else {
					newpw += (char) (rndVal + 55);
				}
			}
			String fpw_pw = bcrypt.encode(newpw);
			Map<String, String> updatemap = new HashMap<String, String>();
			updatemap.put("fpw_id", fpw_id);
			updatemap.put("fpw_name", fpw_name);
			updatemap.put("fpw_email", fpw_email);
			updatemap.put("fpw_pw", fpw_pw);

			System.out.println("임시비번 : " + newpw);
			System.out.println("암호화 임시 비번 : " + bcrypt.encode(newpw));

			int updatepw = service.updatePw(updatemap);
			req.setAttribute("member_pw", pw);
			sendPassword(e1 + "@" + e2, newpw);
			msg = "메일에서 임시 비밀번호를 확인하세요 :-D";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		return "common/msg";
	}

	@RequestMapping("/member/emailAuth")
	public String emailCheck(HttpServletRequest req,
			@RequestParam(value = "member_id", required = false) String member_id,
			@RequestParam(value = "email", required = false) String email) {

		System.out.println(member_id);
		System.out.println(email);
		String authNum = "";

		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}

		authNum = buffer.toString();

		sendEmail(email.toString(), authNum);

		req.setAttribute("email", email);
		req.setAttribute("authNum", authNum);
		return "member/emailAuth";
	}

	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "안녕하세요 CAMPUS PICK 인증번호 메일입니다 :-)";
		String fromName = "CAMPUS PICK 운영자";
		String from = "CAMPUSPICK";
		String to1 = email;

		String content = "인증번호[" + authNum + "]를 회원가입 창에 입력해주세요!";

		try {
			Properties props = new Properties();

			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("ppj1017@gmail.com", "ahfmrqhd1!a");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address1 = { new InternetAddress(to1) };

			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");

			Transport.send(msg);

		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void sendPassword(String email, String newpw) {
		String host = "smtp.gmail.com";
		String subject = "안녕하세요 CAMPUS PICK 임시 비밀번호입니다 :-)";
		String fromName = "CAMPUS PICK 운영자";
		String from = "CAMPUSPICK";
		String to1 = email;

		String content = "[" + newpw + "] 임시 비밀번호로 로그인 후 비밀번호를 변경해주세요!";

		try {
			Properties props = new Properties();

			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("ppj1017@gmail.com", "ahfmrqhd1!a");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address1 = { new InternetAddress(to1) };

			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");

			Transport.send(msg);

		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("member/memberUpdate.do")
	public String memberUpdate(@RequestParam(value = "member_id") String member_id, HttpServletRequest req) {
		Member m = service.loginCheck(member_id);
		System.out.println(m);
		String p1 = m.getMember_phone().substring(3, 7);
		String p2 = m.getMember_phone().substring(7);

		req.setAttribute("p1", p1);
		req.setAttribute("p2", p2);

		int a = m.getMember_email().indexOf("@");
		String e1 = m.getMember_email().substring(0, a);
		String e2 = m.getMember_email().substring(a + 1);

		req.setAttribute("e1", e1);
		req.setAttribute("e2", e2);

		int b = m.getMember_addr().lastIndexOf(",");
		String a1 = m.getMember_addr().substring(0, 5);
		String a2 = m.getMember_addr().substring(5, b + 1);
		String a3 = m.getMember_addr().substring(b + 1);

		req.setAttribute("a1", a1);
		req.setAttribute("a2", a2);
		req.setAttribute("a3", a3);

		// List<String> categoryList = Arrays.asList(m.getEnroll_category());
		//
		// for (int i = 0; i < m.getEnroll_category().length; i++) {
		// categoryList.add(m.getEnroll_category()[i]);
		// }

		String categoryList = "";
		for (int i = 0; i < m.getEnroll_category().length; i++) {
			categoryList += m.getEnroll_category()[i];
		}

		req.setAttribute("categoryList", categoryList);

		return "member/memberUpdate";
	}

	@RequestMapping("member/memberUpdateEnd.do")
	public String memberUpdate(Member member, Model model, HttpServletRequest req,
			@RequestParam(value = "member_phone1") String p1, @RequestParam(value = "member_phone2") String p2,
			@RequestParam(value = "member_phone3") String p3, @RequestParam(value = "member_addr1") String add1,
			@RequestParam(value = "member_addr2") String add2, @RequestParam(value = "member_addr3") String add3,
			@RequestParam(value = "member_level", required = false, defaultValue = "L2") String level) {

		member.setMember_phone(p1 + p2 + p3);
		member.setMember_addr(add1 + add2 + add3);
		String oripw = member.getMember_pw();
		System.out.println("암호화 전 비번 : " + oripw);
		member.setMember_pw(bcrypt.encode(oripw));
		System.out.println("암호화 후 비번 : " + member.getMember_pw());

		int result = service.memberUpdate(member);

		String msg = "";
		String loc = "/member/memberUpdate.do?member_id=" + member.getMember_id();
		if (result > 0) {
			msg = "회원정보가 수정되었습니다.";
		} else {
			msg = "정보수정에 실패하였습니다.";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping("/member/mypage.do")
	public String mypage() {
		return "member/mypage";
	}

	@RequestMapping("/member/memberDelete.do")
	public String memberDelete() {
		return "member/memberDelete";
	}

	@RequestMapping("/member/memberDeleteEnd.do")
	public String memberDeleteEnd(@RequestParam(value = "member_id") String member_id,
			@RequestParam(value = "member_pw") String member_pw, HttpServletRequest req) {
		Member m = service.loginCheck(member_id);
		int result = 0;
		if (bcrypt.matches(member_pw, m.getMember_pw())) {
			result = service.memberDelete(member_id);
		}
		String msg = "";
		String loc = "/";
		if (result > 0) {
			msg = "회원 탈퇴 완료되었습니다. 다음에 또 이용해주세요!";
		} else {
			msg = "비밀번호가 일치하지 않습니다.";
			loc = "/member/memberDelete.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping("/member/adminPage.do")
	public ModelAndView adminPage(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		int cPage;
		try {
			cPage = Integer.parseInt(req.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage;
		try {
			numPerPage = Integer.parseInt(req.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage = 10;
		}

		List<Member> memberList = service.selectMember(cPage, numPerPage);
		for (Member m : memberList) {
			System.out.println(m);
		}
		int totalMember = service.selectCount();

		String pageBar = new PageCreate().getPageBar(cPage, numPerPage, totalMember, "member/adminPage.do");
		mv.addObject("memberList", memberList);
		mv.addObject("cPage", cPage);
		mv.addObject("totalMember", totalMember);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("member/adminpage");

		return mv;
	}

	@RequestMapping("/member/levelChange.do")
	public String levelChange(HttpServletRequest req, String member_id, String level) {
		System.out.println(member_id);
		System.out.println(level);
		Map<String, String> map = new HashMap<String, String>();
		map.put("level", level);
		map.put("member_id", member_id);
		int result = service.levelChange(map);
		System.out.println(result);
		return "member/adminpage";
	}
	@RequestMapping("member/memberFinder.do")
	public ModelAndView memberFinder(HttpServletRequest req, String searchKeyword) {
		ModelAndView mv = new ModelAndView();
		int cPage;
		try {
			cPage = Integer.parseInt(req.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage;
		try {
			numPerPage = Integer.parseInt(req.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage = 10;
		}

		List<Member> list=service.findById(cPage, numPerPage,searchKeyword);
		for (Member m : list) {
			System.out.println(m);
		}
		int totalMember = service.selectCount();
		
		String pageBar = new PageCreate().getPageBar(cPage, numPerPage, totalMember, "member/memberFinder.do");
		mv.addObject("list", list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalMember", totalMember);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("member/memberFinder");

		return mv;	
		}
}
