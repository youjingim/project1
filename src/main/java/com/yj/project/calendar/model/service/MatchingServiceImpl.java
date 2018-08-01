package com.yj.project.calendar.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.calendar.model.dao.MatchingDAO;
import com.yj.project.calendar.model.vo.Calendar;
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

}
