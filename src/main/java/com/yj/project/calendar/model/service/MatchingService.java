package com.yj.project.calendar.model.service;

import java.util.List;
import java.util.Map;

import com.yj.project.calendar.model.vo.Calendar;
import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
import com.yj.project.calendar.model.vo.Matching;

public interface MatchingService {
	int uploadMatching(Calendar calendar);
	List<Calendar> selectList(String category);
	int requestMatching(Matching matching);
	List<Matching> selectMatching();
	int selectDate(Map<String, Object> map);
	int selectDate2(Map<String, Object>map2);
	int selectDate3(Map<String, Object>map2);
	int deleteMatching(int num);
	int successMatching(FinalWithus finalWithus);
	int chageState(int num);
	int failMatching(Map<String, Object> map);
	int noticeInsert(ClubNotice notice);
	int updateNotice(int circle1_num,int circle2_num);
	int updateDate();
	
}
