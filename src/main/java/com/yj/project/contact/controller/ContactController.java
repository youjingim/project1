package com.yj.project.contact.controller;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller

public class ContactController {
     @Autowired
     private JavaMailSender mailSender;
    
    

   @RequestMapping("/contact.do")
   public String contact() {
      return "contact/contactForm";

   }
   
   @RequestMapping("contact/mailSending")
   public String mailSending(HttpServletRequest request) {
      String setfrom = "sinjisu1244@gmail.com";
      String cemail = request.getParameter("cemail");
      System.out.println(cemail);
      String subject = request.getParameter("subject");
      String content = request.getParameter("content");
      String msg=""; 
      String loc="contact.do";
      try {
               MimeMessage message = mailSender.createMimeMessage();
               MimeMessageHelper messageHelper 
                                 = new MimeMessageHelper(message, true, "UTF-8");
          
               messageHelper.setFrom(cemail);  // 보내는사람 생략하거나 하면 정상작동을 안함
               messageHelper.setTo(setfrom);     // 받는사람 이메일
               messageHelper.setSubject(subject); // 메일제목은 생략이 가능하다
              /* messageHelper.setText(content);*/
               messageHelper.setText(cemail+"의 문의가 왔습니다."+"\n\n"+subject+"\n\n"+content);// 메일 내용
              
               mailSender.send(message);
               
              msg="전송 되었습니다. 빠른 시일내에 답변 드리겠습니다.";
             } catch(Exception e){
                e.printStackTrace();             
               
               }
            request.setAttribute("msg", msg);

            request.setAttribute("loc", loc);
            return "common/msg";
}             
}
         


               

   