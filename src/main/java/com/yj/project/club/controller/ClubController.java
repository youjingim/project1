package com.yj.project.club.controller;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;


import com.yj.project.common.page.CirclePageCreate;
import com.yj.project.board.controller.BoardController;
import com.yj.project.board.model.vo.Board;
import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.service.ClubService;
import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.CB_Comment;
import com.yj.project.club.model.vo.Circle_board;
import com.yj.project.club.model.vo.Club;
import com.yj.project.club.model.vo.ReqCircle;
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
		List<CB_Comment> clist=clubService.commentList();
		System.out.println("게시글 목록: "+list);
		System.out.println("댓글 목록: "+clist);
		session.setAttribute("member", member);

		session.setAttribute("club", club);
		session.setAttribute("BoardList", list);
		session.setAttribute("array", array);
		session.setAttribute("clist", clist);

		List<Matching> matchings = clubService.selectMatching(member.getCircle1_num());
		List<ClubNotice> noticeList = clubService.selectNotice(member.getCircle1_num());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("circle_num", member.getCircle1_num());
		int total=member.getMember_notice();
		System.out.println("이거" + total);

		session.setAttribute("matching", matching);
		session.setAttribute("club", club);
		session.setAttribute("total", total);
		session.setAttribute("noticeList", noticeList);
		model.addAttribute("BoardList", list);
		model.addAttribute("categoryArr", array);
		

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
		List<String> g1=clubService.selectG1(circle_num);
		System.out.println("그림1: "+g1);
		List<String> g2=clubService.selectG2(circle_num);
		System.out.println("그림2 : "+g2);
		
		List<String> total=new ArrayList<String>();
		for(int i = 0; i < g1.size(); i++) {
			if(g1.get(i)!=null) {
				total.add(g1.get(i));
			}
		}
		for(int i = 0; i < g1.size(); i++) {
			if(g2.get(i)!=null) {
				total.add(g2.get(i));
			}
		}
		System.out.println("assdf"+total);
		model.addAttribute("gallery", total);
		return "clubPage/clubGallery";
	}

	//동아리 게시글 작성 로직
	@RequestMapping("clubMainPage.do")
	public ModelAndView insertCBoard(String cb_title,String cb_content,int circle_num,String member_id,
			@RequestParam(value="cb_attachment", required=false, defaultValue="null") MultipartFile cb_attachment,
			@RequestParam(value="cb_attachment2", required=false, defaultValue="null") MultipartFile cb_attachment2,
			HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		Circle_board cb1 = new Circle_board();
		cb1.setCb_title(cb_title);
		cb1.setCb_content(cb_content);
		cb1.setCircle_num(circle_num);
		cb1.setMember_id(member_id);
		cb1.setCb_attachment(null);
		cb1.setCb_reattachment(null);
		cb1.setCb_attachment2(null);
		cb1.setCb_reattachment2(null);
		
		if(cb_attachment != null) {
	         
	         String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/club");
	         
	         File dir=new File(saveDir);
	         if(dir.exists()==false) System.out.println(dir.mkdirs());//폴더생성
	         System.out.println(cb_attachment);
	         if(!cb_attachment.isEmpty()) {
	         String originalFileName=cb_attachment.getOriginalFilename();
	         
	         //확장자 구하기
	         String ext=originalFileName.substring(originalFileName.lastIndexOf(".")+1);
	         SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
	         int rndNum=(int)(Math.random()*1000);
	         String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
	         renamedFileName+="_"+rndNum+"."+ext;
	         try 
	         {
	        	 cb_attachment.transferTo(new File(saveDir+File.separator+renamedFileName));
	         }
	         catch(IOException e)
	         {
	            e.printStackTrace();
	         }
	            //DB에 저장할 첨부파일에 대한 정보를 구성!
	         	cb1.setCb_attachment(originalFileName);
	         	cb1.setCb_reattachment(renamedFileName);
	         }
	      }
		if(cb_attachment2 != null) {
	         
	         String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/club");
	         
	         File dir=new File(saveDir);
	         if(dir.exists()==false) System.out.println(dir.mkdirs());//폴더생성
	         System.out.println(cb_attachment2);
	         if(!cb_attachment2.isEmpty()) {
	         String originalFileName=cb_attachment2.getOriginalFilename();
	         
	         //확장자 구하기
	         String ext=originalFileName.substring(originalFileName.lastIndexOf(".")+1);
	         SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
	         int rndNum=(int)(Math.random()*1000);
	         String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
	         renamedFileName+="_"+rndNum+"."+ext;
	         try 
	         {
	        	 cb_attachment2.transferTo(new File(saveDir+File.separator+renamedFileName));
	         }
	         catch(IOException e)
	         {
	            e.printStackTrace();
	         }
	            //DB에 저장할 첨부파일에 대한 정보를 구성!
	         	cb1.setCb_attachment2(originalFileName);
	         	cb1.setCb_reattachment2(renamedFileName);
	         }
	      }
		System.out.println(cb1.getCb_attachment());
		System.out.println(cb1.getCb_reattachment());
		System.out.println(cb1.getCb_attachment2());
		System.out.println(cb1.getCb_reattachment2());
		
/*		if(cb1.getCb_attachment()==null) {
			cb1.setCb_attachment("notFoundFile");
			cb1.setCb_reattachment("notFoundFile");
		}
		if(cb1.getCb_attachment2()==null) {
			cb1.setCb_attachment2("notFoundFile");
			cb1.setCb_reattachment2("notFoundFile");
		}*/
		int result=clubService.insertBoard(cb1);
		
		String msg="";
		if(result>0) {
			msg="등록을 성공하였습니다";
		}
		else {
			msg="등록에 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "clubMain.do?member_id="+cb1.getMember_id());
		
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
	public ModelAndView insertBudget(Date used_date,int budget_output,int budget_input, String budget_content,
			int circle_num, String member_id,
			@RequestParam(value="upFile", required=false, defaultValue="null") MultipartFile upFile,
			HttpServletRequest request
			) {
		ModelAndView mv=new ModelAndView();
		Budget b=new Budget();
		b.setUsed_date(used_date);
		b.setBudget_output(budget_output);
		b.setBudget_input(budget_input);
		b.setBudget_content(budget_content);
		b.setCircle_num(circle_num);
		b.setMember_id(member_id);
		int balance=0;
		if(b.getBudget_input()>b.getBudget_output()) {
			balance=b.getBudget_input()-b.getBudget_output();
			
		}else {
			balance=b.getBudget_output()-b.getBudget_input();
		}
		
		if(upFile != null) {
	         
	         String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/club");
	         
	         File dir=new File(saveDir);
	         if(dir.exists()==false) System.out.println(dir.mkdirs());//폴더생성
	         System.out.println(upFile);
	         if(!upFile.isEmpty()) {
	         String originalFileName=upFile.getOriginalFilename();
	         
	         //확장자 구하기
	         String ext=originalFileName.substring(originalFileName.lastIndexOf(".")+1);
	         SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
	         int rndNum=(int)(Math.random()*1000);
	         String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
	         renamedFileName+="_"+rndNum+"."+ext;
	         try 
	         {
	        	 upFile.transferTo(new File(saveDir+File.separator+renamedFileName));
	         }
	         catch(IOException e)
	         {
	            e.printStackTrace();
	         }
	            //DB에 저장할 첨부파일에 대한 정보를 구성!
	         	b.setAttachment(originalFileName);
	         	b.setReattachment(renamedFileName);
	         }
	      }
		
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


	@RequestMapping("circle_calendar.do")
	public ModelAndView calendar(@RequestParam(value="circle_num")int circle_num,@RequestParam(value="member_id")String member_id,HttpSession session) {
		Member member=clubService.selectOne(member_id);
		List<FinalWithus> matchingList = clubService.selectClubMatching(circle_num);
		List<Member> memberList = clubService.selectMember(circle_num);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("circle_num", circle_num);
		int noticeCount = member.getMember_notice();
		int result = clubService.noticeUpdate(member_id);
		
		if(result>0) {
			logger.debug("notice 업데이트 성공");
		}else {
			logger.debug("notice 업데이트 실패");
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("noticeCount",noticeCount);
		mv.addObject("list",matchingList);
		mv.addObject("memberList",memberList);
		mv.setViewName("clubPage/clubCalendar");
		session.setAttribute("total", 0);
		
		return mv;
		
	}
	
	@RequestMapping("/createClub")
	public String createClub() {
		return "clubPage/createClub";
	}
	
	@RequestMapping("/clubCreateEnd")
	public ModelAndView createClubEnd(ReqCircle club,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int result = clubService.createClub(club);
		return mv;
	}
	//댓글 삭제 로직
	@RequestMapping("deleteComment.do")
	public ModelAndView deleteComment(int no,String id) {
		ModelAndView mv = new ModelAndView();
		System.out.println("댓글 번호:"+no);
		System.out.println("아이디:"+id);
		int result=clubService.deleteComment(no);
		System.out.println("댓글 삭제 성공:"+result);
		
		String msg="";
		if(result>0) {
			msg="삭제를 성공하였습니다";
		}
		else {
			msg="삭제를 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "clubMain.do?member_id="+id);
		
		mv.setViewName("common/msg");
		return mv;
		
	}
	//예산에서 파일 다운로드 로직
	@RequestMapping("budgetDownload.do")
	public void fileDownload(String oName, String rName, HttpServletRequest req,HttpServletResponse res) {
		logger.debug("원본명 : "+oName+", 변경된 값 : "+rName);
		
		//스트림 생성
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;
		//저장 경로
		String savedDir=req.getSession().getServletContext().getRealPath("/resources/upload/club");
		File savedFile=new File(savedDir+"/"+rName);
		try {
			FileInputStream fis=new FileInputStream(savedFile);
			bis=new BufferedInputStream(fis);
			sos=res.getOutputStream();
			
			String resFilename="";
			//브라우저 분기
			boolean isMSIE=req.getHeader("user-agent").indexOf("MSIE")!=-1
					|| req.getHeader("user-agent").indexOf("Trident")!=-1;
			if(isMSIE) {
				resFilename=URLEncoder.encode(oName, "UTF-8");
				resFilename=resFilename.replaceAll("\\", "%20");
			}else {
				resFilename=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			res.setContentType("application/otect-stream;charset=UTF-8");
			res.setHeader("Content-Disposition", "attachment;filename=\""+resFilename+"\"");
			res.setContentLength((int)savedFile.length());
			
			//파일 읽어와서 전송하기
			int read=-1;
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				sos.close();
				bis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	@RequestMapping("changeGrade.do")
	public String chageGrade(String id,
			@RequestParam(value="memberGrade",defaultValue="L2",required=false) String grade
			) {
		System.out.println("회원 아이디 : "+id);
		System.out.println("변경할 등급 : "+grade);
		return "";
	}
}
