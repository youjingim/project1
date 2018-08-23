package com.yj.project.message.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yj.project.common.page.PageCreate;
import com.yj.project.member.model.vo.Member;
import com.yj.project.message.model.service.MessageService;
import com.yj.project.message.model.vo.Message;

@Controller
public class MessageController {
	private Logger logger=LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	private MessageService messageService;
	
	//쪽지페이지로 넘기는 로직(처음이 내가 받은 쪽지)
	@RequestMapping("myMessage.do")
	public ModelAndView messageHome(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,String member_id) {
		ModelAndView mv = new ModelAndView();
		int numPerPage=10;
		System.out.println("회원 아이디:"+member_id);
		List<Message> ReceiveList=messageService.selectReceiveList(member_id,cPage,numPerPage);
		for(Message m:ReceiveList) {
			System.out.println(m);
		}
		List<Message> SendList=messageService.selectSendList(member_id,cPage,numPerPage);
		for(Message m:SendList) {
			System.out.println(m);
		}
		int totalCount1=messageService.selectReceiveCount(member_id);
		System.out.println("내가 받은 쪽지의 수 : "+totalCount1);
		int totalCount2=messageService.selectSendCount(member_id);
		System.out.println("내가 보낸 쪽지의 수 : "+totalCount2);
		String rPageBar=new PageCreate().getPageBar(cPage,numPerPage,totalCount1,"myMessage.do");
		String sPageBar=new PageCreate().getPageBar(cPage,numPerPage,totalCount2,"myMessage.do");
		mv.addObject("rPageBar",rPageBar);
		mv.addObject("sPageBar",sPageBar);
		mv.addObject("ReceiveList",ReceiveList);
		mv.addObject("SendList", SendList);
		mv.addObject("cPage",cPage);
		mv.addObject("totalCount",totalCount1);
		mv.addObject("totalCount2",totalCount2);
		mv.setViewName("message/receiveMessage");
		return mv;
	}
	
}
