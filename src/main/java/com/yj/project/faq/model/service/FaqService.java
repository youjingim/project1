package com.yj.project.faq.model.service;
import java.util.List;
import java.util.Map;

import com.yj.project.faq.model.vo.Faq;
import com.yj.project.notice.model.vo.Notice;

public interface FaqService {
	
	List<Faq> selectFaqList();
	int faqUp(Map<String, Object> map);
/*s*/

}
