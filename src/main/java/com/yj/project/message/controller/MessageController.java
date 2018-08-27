package com.yj.project.message.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yj.project.club.model.vo.Circle_join;
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
	@RequestMapping("messageView2.do")
	public String messageView2(int message_num, Model model) {
		System.out.println("메세지 번호:"+message_num);
		Message message=messageService.selectMessageOne(message_num);
		System.out.println("내가 불러온 메세지:"+message);
		model.addAttribute("message", message);
		return "message/messageView2";
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
	public ModelAndView deleteMessage(int message_num,String mid) {
		ModelAndView mv=new ModelAndView();
		System.out.println("삭제할 메시지 번호:"+message_num);
		int result = messageService.deleteMessage(message_num);
		System.out.println(result);
		
		String msg="";
		if(result>0) {
			msg="쪽지 삭제를 성공하였습니다";
		}
		else {
			msg="삭제를 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "myMessage.do?member_id="+mid);
		
		mv.setViewName("common/msg");
		return mv;
	}
	//답장 보내는 로직
	@RequestMapping("reSendMessage2.do")
	public ModelAndView insertReSend(String yid, String mid,String title,String content) {
		ModelAndView mv=new ModelAndView();
		System.out.println("yid"+yid);
		System.out.println("mid"+mid);
		System.out.println("title"+title);
		System.out.println("content:"+content);
		Message m=new Message();
		m.setMessage_content(content);
		m.setMessage_title(title);
		m.setMessage_receiver(yid);
		m.setMessage_sender(mid);
		int result = messageService.insertSend(m);
		System.out.println("메세지 입력 여부:"+result);
		String msg="";
		if(result>0) {
			msg="쪽지 보내기를 성공하였습니다";
		}
		else {
			msg="쪽지 보내기 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "myMessage.do?member_id="+mid);
		mv.setViewName("common/msg");
		return mv;
	}
	//답장 보내는 로직
		@RequestMapping("circleMessage.do")
		public ModelAndView insertSend(String yid, String mid,String title,String content) {
			ModelAndView mv=new ModelAndView();
			System.out.println("yid"+yid);
			System.out.println("mid"+mid);
			System.out.println("title"+title);
			System.out.println("content:"+content);
			Message m=new Message();
			m.setMessage_content(content);
			m.setMessage_title(title);
			m.setMessage_receiver(yid);
			m.setMessage_sender(mid);
			int result = messageService.insertSend(m);
			System.out.println("메세지 입력 여부:"+result);
			String msg="";
			if(result>0) {
				msg="쪽지 보내기를 성공하였습니다";
			}
			else {
				msg="쪽지 보내기 실패하였습니다. 다시확인해주세요";
			}
			mv.addObject("msg",msg);
			mv.addObject("loc", "clubMain.do?member_id="+mid);
			mv.setViewName("common/msg");
			return mv;
		}
	@RequestMapping("circleMemberMessage.do")
	public ModelAndView insertCircleMemberSend(String yid, String mid,String title,String content,int cNum) {
		ModelAndView mv=new ModelAndView();
		System.out.println("yid"+yid);
		System.out.println("mid"+mid);
		System.out.println("title"+title);
		System.out.println("content:"+content);
		Message m=new Message();
		m.setMessage_content(content);
		m.setMessage_title(title);
		m.setMessage_receiver(yid);
		m.setMessage_sender(mid);
		int result = messageService.insertSend(m);
		System.out.println("메세지 입력 여부:"+result);
		String msg="";
		if(result>0) {
			msg="쪽지 보내기를 성공하였습니다";
		}
		else {
			msg="쪽지 보내기 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "circle_list.do?circle_num="+cNum);
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("circleMemberMessage2.do")
	public ModelAndView insertCircleMemberSend2(Message m, int num) {
		ModelAndView mv=new ModelAndView();
		System.out.println("메시지"+m);
		System.out.println("동아리 번호:"+num);
		int result = messageService.insertSend(m);
		System.out.println("메세지 입력 여부:"+result);
		String msg="";
		if(result>0) {
			msg="쪽지 보내기를 성공하였습니다";
		}
		else {
			msg="쪽지 보내기 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "joinCircleMember.do?circle_num="+num+"&member_id="+m.getMessage_receiver());
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("deleteCheck.do")
	public ModelAndView deleteCheckBox(@RequestParam("chk") int[] check,String receivId) {
		ModelAndView mv=new ModelAndView();
		int result=0;
		System.out.println("아이디:"+receivId);
		for(int checkNum : check) {
			System.out.println("체크값:"+checkNum);
			result=messageService.deleteMessage(checkNum);
		}
		System.out.println("result:"+result);
		String msg="";
		if(result>0) {
			msg="쪽지 삭제를 성공하였습니다";
		}
		else {
			msg="쪽지 삭제를 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "myMessage.do?member_id="+receivId);
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("deleteCheck1.do")
	public ModelAndView deleteCheckBox2(@RequestParam("chk") int[] check, String senderId) {
		ModelAndView mv=new ModelAndView();
		int result=0;
		System.out.println("아이디:"+senderId);
		for(int checkNum : check) {
			System.out.println("체크값:"+checkNum);
			result=messageService.deleteMessage(checkNum);
		}
		System.out.println("result:"+result);
		
		String msg="";
		if(result>0) {
			msg="쪽지 삭제를 성공하였습니다";
		}
		else {
			msg="쪽지 삭제를 실패하였습니다. 다시확인해주세요";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", "myMessage2.do?member_id="+senderId);
		mv.setViewName("common/msg");
		return mv;
	}
}
