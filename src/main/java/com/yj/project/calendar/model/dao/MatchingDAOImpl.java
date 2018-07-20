package com.yj.project.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yj.project.calendar.model.vo.Calendar;
@Repository
public class MatchingDAOImpl implements MatchingDAO{
	@Autowired
	SqlSessionTemplate sqlSession;

	
	@Override
	public int uploadMatching(Calendar calendar) {
		return sqlSession.insert("matching.upload",calendar);
	}

}
