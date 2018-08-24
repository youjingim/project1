package com.yj.project.message.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yj.project.common.page.MessagePageCreate;
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
		int totalCount=messageService.selectReceiveCount(member_id);
		System.out.println("내가 받은 쪽지의 수 : "+totalCount);
		String PageBar=new MessagePageCreate().getPageBar(cPage,numPerPage,totalCount,"myMessage.do",member_id);
		mv.addObject("member_id", member_id);
		mv.addObject("PageBar",PageBar);
		mv.addObject("ReceiveList",ReceiveList);
		mv.addObject("cPage",cPage);
		mv.addObject("totalCount",totalCount);
		mv.setViewName("message/receiveMessage");
		return mv;
	}
	@RequestMapping("myMessage2.do")
	public ModelAndView messageHome2(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,String member_id) {
		ModelAndView mv = new ModelAndView();
		int numPerPage=10;
		System.out.println("회원 아이디:"+member_id);
		List<Message> SendList=messageService.selectSendList(member_id,cPage,numPerPage);
		for(Message m:SendList) {
			System.out.println(m);
		}
		int totalCount=messageService.selectSendCount(member_id);
		System.out.println("내가 보낸 쪽지의 수 : "+totalCount);
		String PageBar=new MessagePageCreate().getPageBar(cPage,numPerPage,totalCount,"myMessage2.do",member_id);
		mv.addObject("member_id", member_id);
		mv.addObject("PageBar",PageBar);
		mv.addObject("SendList", SendList);
		mv.addObject("cPage",cPage);
		mv.addObject("totalCount",totalCount);
		mv.setViewName("message/sendMessage");
		return mv;
	}
	@RequestMapping("messageView.do")
	public String messageView(int message_num, Model model) {
		System.out.println("메세지 번호:"+message_num);
		Message message=messageService.selectMessageOne(message_num);
		System.out.println("내가 불러온 메세지:"+message);
		model.addAttribute("message", message);
		return "message/messageView";
	}
	//내가 받은 메시지 답장 페이지 넘기는 로직
	@RequestMapping("reSendMessage.do")
	public String reSendMessage(String mid,String yid,Model model) {
		System.out.println("내 아이디:"+mid);
		System.out.println("상대방 아이디:"+yid);
		model.addAttribute("mid", mid);
		model.addAttribute("yid", yid);
		return "message/reSendMessage";
	}
	//메세지 삭제 로직
	@RequestMapping("deleteMessage.do")
	public String deleteMessage(int message_num) {
		System.out.println("삭제할 메시지 번호:"+message_num);
		return "";
	}
}
