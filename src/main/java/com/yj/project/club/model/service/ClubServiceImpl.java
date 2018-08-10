package com.yj.project.club.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.dao.ClubDAO;
import com.yj.project.club.model.vo.Club;
import com.yj.project.member.model.vo.Member;

@Service
public class ClubServiceImpl implements ClubService {
	@Autowired
	public ClubDAO clubDAO;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectOne(String id) {
		return clubDAO.selectOne(sqlSession,id);
	}

	@Override
	public Club selectClub(int circle_num) {
		return clubDAO.selectClub(sqlSession,circle_num);
	}

	@Override
	public List<Member> selectMember(int circle_num) {
		return clubDAO.selectMember(sqlSession,circle_num);
	}

	@Override
	public List<Matching> selectMatching(int circle1_num) {
		return clubDAO.selectMatching(sqlSession,circle1_num);
	}
	
	
}
