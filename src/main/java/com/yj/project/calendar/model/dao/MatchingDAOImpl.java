package com.yj.project.calendar.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yj.project.calendar.model.vo.Calendar;
import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
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
	public int selectDate2(Map<String, Object> map2) {
		return sqlSession.selectOne("matching.selectDate2",map2);
	}

	@Override
	public int deleteMatching(int num) {
		return sqlSession.delete("matching.deleteMatching",num);
	}


	@Override
	public int successMatching(FinalWithus finalWithus) {
		return sqlSession.insert("matching.successMatching",finalWithus);
	}


	@Override
	public int chageState(int num) {
		int result1 = sqlSession.update("matching.chageState1",num);
		int result2 = sqlSession.update("matching.chageState2",num);
		if(result1>0 && result2>0) {
			return 1;
		}else {
		return 0;
		}
	}


	@Override
	public int failMatching(Map<String, Object> map) {
		return sqlSession.delete("matching.failMatching",map);
	}


	@Override
	public int noticeInsert(ClubNotice notice) {
		return sqlSession.insert("matching.insertNotice",notice);
	}


	@Override
	public int updateNotice(int circle1_num, int circle2_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("circle1_num", circle1_num);
		map.put("circle2_num", circle2_num);
		return sqlSession.update("matching.updateNotice",map);
	}




}
