package com.yj.project.faq.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.faq.model.dao.FaqDAO;
import com.yj.project.faq.model.vo.Faq;
@Service
public class FaqServiceImpl implements FaqService{
   
    @Autowired
      private FaqDAO faqDAO;
      private Logger logger = LoggerFactory.getLogger(FaqServiceImpl.class);
   
      @Override
      public List<Faq> selectFaqList() {
            
            return faqDAO.selectFaqList();
            
         }

   @Override
   public int faqUp(Map<String, Object> map) {
      
      return faqDAO.faqUp(map);
   }
      @Override
      public int faqDelete(int faqNo) {
        return faqDAO.faqDelete(faqNo);
   }

   @Override
   public int faqWrite(Faq faq) {
      
      return faqDAO.faqWrite(faq);
   }
}