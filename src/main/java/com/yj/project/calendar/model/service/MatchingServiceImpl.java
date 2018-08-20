package com.yj.project.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.calendar.model.dao.MatchingDAO;
import com.yj.project.calendar.model.vo.Calendar;
import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
import com.yj.project.calendar.model.vo.Matching;
@Service
public class MatchingServiceImpl implements MatchingService{
	@Autowired
	MatchingDAO matchingDAO;
	
	@Override
	public int uploadMatching(Calendar calendar) {
		return matchingDAO.uploadMatching(calendar);
	}

	@Override
	public List<Calendar> selectList(String category) {
		return matchingDAO.selectList(category);
	}

	@Override
	public int requestMatching(Matching matching) {
		return matchingDAO.requestMatching(matching);
	}

	@Override
	public List<Matching> selectMatching() {
		return matchingDAO.selectMatching();
	}

	@Override
	public int selectDate(Map<String, Object> map) {
		return matchingDAO.selectDate(map);
	}

	@Override
	public int deleteMatching(int num) {
		return matchingDAO.deleteMatching(num);
	}

	@Override
	public int successMatching(FinalWithus finalWithus) {
		return matchingDAO.successMatching(finalWithus);
	}

	@Override
	public int chageState(int num) {
		return matchingDAO.chageState(num);
	}

	@Override
	public int failMatching(Map<String, Object> map) {
		return matchingDAO.failMatching(map);
	}

	@Override
	public int noticeInsert(ClubNotice notice) {
		return matchingDAO.noticeInsert(notice);
	}

	@Override
	public int updateNotice(int circle1_num, int circle2_num) {
		return matchingDAO.updateNotice(circle1_num,circle2_num);
	}

	@Override
	public int selectDate2(Map<String, Object> map2) {
		return matchingDAO.selectDate2(map2);
	}

	@Override
	public int updateDate() {
		return matchingDAO.updateDate();
	}

	@Override
	public int selectDate3(Map<String, Object> map2) {
		return matchingDAO.selectDate3(map2);
	}

}
