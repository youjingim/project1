package com.yj.project.notice.controller;



import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import javax.servlet.http.HttpServletRequest;*/

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yj.project.notice.controller.NoticeController;
import com.yj.project.notice.model.service.NoticeService;
import com.yj.project.notice.model.vo.Notice;

import com.yj.project.common.page.PageCreate;
@Controller

public class NoticeController {

	private Logger logger=LoggerFactory.getLogger(NoticeController.class);
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice/noticeList.do")
	public ModelAndView noticeList(@RequestParam (value="cPage",required=false,defaultValue="1")int cPage) {
		if(logger.isDebugEnabled()) {
			logger.debug("게시판 목록페이지 시작" + cPage);
		}
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Notice> list = noticeService.selectNoticeList(cPage,numPerPage);
		
		int totalCount = noticeService.selectCount();
		
		String pageBar = new PageCreate().getPageBar(cPage,numPerPage,totalCount,"noticeList.do");
		mv.addObject("list",list);
		mv.addObject("cPage",cPage);
		mv.addObject("totalCount",totalCount);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("/notice/noticeList");
		return mv;
	}
	   @RequestMapping("/notice/noticeForm.do")
	   public String noticeForm() {
	      
	      return "notice/noticeForm";
	   }
	   
	@RequestMapping("/notice/noticeView.do")
	public ModelAndView noticeView(@RequestParam(value="no") int noticeNo,HttpServletRequest request,HttpServletResponse response) 
	{
		

	      //조회수 증가!
	      Cookie[] cookie=request.getCookies();
	      String noticeCookieVal="";
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
	               
	               if("noticeCookie".equals(name))
	               {
	                  noticeCookieVal=value;
	                  if(value.contains("|"+noticeNo+"|"))
	                  {
	                     hasRead=true;
	                     break outter;
	                  }
	               }
	            }
	      }
	      
	      if(!hasRead)
	      {

	         noticeService.viewCount(noticeNo);
	         Cookie c=new Cookie("noticeCookie",noticeCookieVal+"|"+noticeNo+"|");
	         c.setMaxAge(-1);
	         //브라우저가 닫는 경우 삭제
	         response.addCookie(c);      
	      }
	      
	      
		ModelAndView mv = new ModelAndView();
		Notice notice = noticeService.noticeView(noticeNo);
		mv.addObject("notice",notice);
		mv.setViewName("notice/noticeView");
		return mv;
		
	}
	   @RequestMapping("/notice/noticeWrite")
	   public ModelAndView noticeWrite(Notice notice){
	      ModelAndView mv = new ModelAndView();
	      int result = noticeService.noticeWrite(notice);
	      String msg="";
	      String loc="/notice/noticeList.do";
	      if(result>0) {
	         msg="게시물 등록 성공!";
	      }else {
	         msg="게시물 등록 실패!";
	      }
	      mv.addObject("msg",msg);
	      mv.addObject("loc",loc);
	      
	      mv.setViewName("common/msg");
	      
	      return mv;
	   }
	   @RequestMapping("notice/noticeUpdate")
	   public String noticeUpdate(@RequestParam(value="no")int noticeNo,HttpServletRequest request) {
	   Notice n = noticeService.noticeView(noticeNo);
	   request.setAttribute("notice", n);
	   return "notice/noticeUpdate";
		  
	   }
	   
	   @RequestMapping("/notice/noticeUpdateEnd.do")
	   public ModelAndView noticeUpdateEnd(Notice notice) {
	   ModelAndView mv=new ModelAndView();
	   int result=noticeService.noticeUpdateEnd(notice);
	   String msg="";
	   String loc="/notice/noticeList.do";
	   if(result>0) {
	      msg="게시물 수정 성공!";
	   }else {
	      msg="게시물 수정 실패!";
	   }
	   mv.addObject("msg",msg);
	   mv.addObject("loc",loc);
	   
	   mv.setViewName("common/msg");
	   
	   return mv;
	}
	   @RequestMapping("notice/noticeDelete.do")
	   public ModelAndView noticeDelete(@RequestParam(value="no")int noticeNo) {
	   ModelAndView mv = new ModelAndView();
	   int result=noticeService.noticeDelete(noticeNo);
	   String msg="";
	   String loc="/notice/noticeList.do";
	   if(result>0) {
	      msg="게시물 삭제 성공!";
	   }else {
	      msg="게시물 삭제 실패!";
	   }
	   mv.addObject("msg",msg);
	   mv.addObject("loc",loc);
	   
	   mv.setViewName("common/msg");
	   
	   return mv;

	   }   
		   
	   
	   
	   
	   
/*	@RequestMapping("/noticeList.do")
	public String notice(HttpServletRequest req) {
		return "notice/noticeList";

}*/
/*	@RequestMapping("/notice/noticeForm.do")
	public String noticeForm(HttpServletRequest req) {
		return "notice/noticeForm";
		
	}*/
}
