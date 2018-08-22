package com.yj.project.faq.model.dao;

import java.util.List;
import java.util.Map;

import com.yj.project.faq.model.vo.Faq;

public interface FaqDAO {
	
	 List<Faq> selectFaqList();
	 int faqUp(Map<String, Object>map);
/*		int faqWrite(Faq faq);*/

}
