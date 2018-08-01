package com.yj.project.calendar.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yj.project.calendar.model.vo.Calendar;
import com.yj.project.calendar.model.vo.Matching;
@Repository
public class MatchingDAOImpl implements MatchingDAO{
	@Autowired
	SqlSessionTemplate sqlSession;

	
	@Override
	public int uploadMatching(Calendar calendar) {
		return sqlSession.insert("matching.upload",calendar);
	}


	@Override
	public List<Calendar> selectList(String category) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		return sqlSession.selectList("matching.selectList",map);
	}


	@Override
	public int requestMatching(Matching matching) {
		return sqlSession.insert("matching.reqMatching",matching);
	}


	@Override
	public List<Matching> selectMatching() {
		return sqlSession.selectList("matching.selectMatching");
	}


	@Override
	public int selectDate(Map<String, Object> map) {
		return sqlSession.selectOne("matching.selectDate",map);
	}


	@Override
	public int deleteMatching(int num) {
		return sqlSession.delete("matching.deleteMatching",num);
	}

}
