package com.yj.project.faq.model.service;
import java.util.List;
import java.util.Map;

import com.yj.project.faq.model.vo.Faq;

public interface FaqService {
   
   List<Faq> selectFaqList();
   int faqUp(Map<String, Object> map);
   int faqDelete(int faqNo);
   int faqWrite(Faq faq);

}