package com.yj.project.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yj.project.faq.model.vo.Faq;
import com.yj.project.notice.model.vo.Notice;
import com.yj.project.common.page.PageCreate;
import com.yj.project.faq.controller.FaqController;
import com.yj.project.faq.model.service.FaqService;
import com.yj.project.faq.model.vo.Faq;

@SuppressWarnings("unused")
@Controller

public class FaqController {
      private Logger logger=LoggerFactory.getLogger(FaqController.class);
      @Autowired
      private FaqService faqService;


   @RequestMapping("/faq.do")
      public ModelAndView faqList(HttpServletRequest request,HttpServletResponse response) {
         
         ModelAndView mv = new ModelAndView();
         List<Faq> list = faqService.selectFaqList();     
         System.out.println(list);
         mv.addObject("list",list);
         mv.setViewName("faq/faq");
         return mv;
      }
   @RequestMapping("/faqUpdate.do")
   public ModelAndView faqUpdate(@RequestParam(value="title")String title,@RequestParam(value="content")String content,@RequestParam(value="num")int num) {
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("title", title);
         map.put("content", content);
         map.put("num", num);
         
         ModelAndView mv = new ModelAndView();
         int result = faqService.faqUp(map);
         String msg = "";
         String loc = "/faq.do";
         if(result>0) {
            msg="수정성공";
            
         }else {
            msg="수정실패";
         }
         mv.addObject("msg",msg);
         mv.addObject("loc",loc);
         mv.setViewName("common/msg");
         
      return mv;
   }
    @RequestMapping("faq/faqDelete.do")
      public ModelAndView faqDelete(int faqNo) {
       System.out.println(faqNo);
      ModelAndView mv = new ModelAndView();
      int result=faqService.faqDelete(faqNo);
      String msg="";
      String loc="/faq.do";
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
    @RequestMapping("faqWrite.do")
      public ModelAndView faqWrite(Faq faq){
         ModelAndView mv = new ModelAndView();
         int result = faqService.faqWrite(faq);
         String msg="";
         String loc="faq.do";
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

   
}