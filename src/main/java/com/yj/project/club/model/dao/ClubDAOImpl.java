package com.yj.project.club.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.vo.Club;
import com.yj.project.member.model.vo.Member;

@Repository
public class ClubDAOImpl implements ClubDAO {

	@Override
	public Member selectOne(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("club.selectOne",id);
	}

	@Override
	public Club selectClub(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectOne("club.selectClub",circle_num);
	}

	@Override
	public List<Member> selectMember(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectList("club.selectMember",circle_num);
	}

	@Override
	public List<Matching> selectMatching(SqlSessionTemplate sqlSession, int circle1_num) {
		return sqlSession.selectList("club.selectMatching",circle1_num);
	}
	

}
