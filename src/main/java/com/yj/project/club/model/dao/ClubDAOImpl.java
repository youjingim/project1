package com.yj.project.club.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.Circle_board;
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
	public int insertBudget(SqlSessionTemplate sqlSession, Budget b) {
		return sqlSession.insert("club.insertBudget", b);
	}

	@Override
	public int insertBoard(SqlSessionTemplate sqlSession, Circle_board cb) {
		return sqlSession.insert("club.insertBoard", cb);
	}

	@Override
	public List<Circle_board> selectBoardList(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectList("club.selectBoardList", circle_num);
	}

	@Override
	public int deleteBoard(SqlSessionTemplate sqlSession, int cb_num) {
		return sqlSession.delete("club.deleteBoard",cb_num);
	}

	@Override
	public Circle_board selectBoardOne(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("club.selectBoardOne", no);
	}

	@Override
	public int updateBoard(SqlSessionTemplate sqlSession, Circle_board cb) {
		return sqlSession.update("club.updateBoard",cb);
	}
	@Override
	public List<Matching> selectMatching(SqlSessionTemplate sqlSession, int circle1_num) {
		return sqlSession.selectList("club.selectMatching",circle1_num);
	}
	

}
