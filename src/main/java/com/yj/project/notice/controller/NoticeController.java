package com.yj.project.notice.controller;



import java.util.List;

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
	@RequestMapping("/notice/noticeView.do")
	public ModelAndView noticeView(@RequestParam(value="no") int noticeNo)
	{
		ModelAndView mv = new ModelAndView();
		Notice notice = noticeService.noticeView(noticeNo);
		mv.addObject("notice",notice);
		mv.setViewName("notice/noticeView");
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
