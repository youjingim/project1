package com.yj.project.calendar.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.yj.project.calendar.model.vo.Calendar;
import com.yj.project.calendar.model.vo.Matching;

public interface MatchingService {
	int uploadMatching(Calendar calendar);
	List<Calendar> selectList(String category);
	int requestMatching(Matching matching);
	List<Matching> selectMatching();
	int selectDate(Map<String, Object> map);
	int deleteMatching(int num);
}
