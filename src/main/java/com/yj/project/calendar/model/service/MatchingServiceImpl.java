package com.yj.project.calendar.model.service;

import org.springframework.stereotype.Service;

import com.yj.project.calendar.model.dao.MatchingDAO;
import com.yj.project.calendar.model.vo.Calendar;
@Service
public class MatchingServiceImpl implements MatchingService{
	
	MatchingDAO matchingDAO;
	
	@Override
	public int uploadMatching(Calendar calendar) {
		return matchingDAO.uploadMatching(calendar);
	}

}
