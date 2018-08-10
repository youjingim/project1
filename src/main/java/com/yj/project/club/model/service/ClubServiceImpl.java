package com.yj.project.club.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.dao.ClubDAO;
import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.Circle_board;
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
	public int insertBudget(Budget b) {
		return clubDAO.insertBudget(sqlSession,b);
	}

	@Override
	public int insertBoard(Circle_board cb) {
		return clubDAO.insertBoard(sqlSession,cb);
	}

	@Override
	public List<Circle_board> selectBoardList(int circle_num) {
		return clubDAO.selectBoardList(sqlSession,circle_num);
	}

	@Override
	public int deleteBoard(int no) {
		return clubDAO.deleteBoard(sqlSession,no);
	}

	@Override
	public Circle_board selectBoardOne(int no) {
		return clubDAO.selectBoardOne(sqlSession,no);
	}

	@Override
	public int updateBoard(Circle_board cb) {
		return clubDAO.updateBoard(sqlSession,cb);
	}
	@Override
	public List<Matching> selectMatching(int circle1_num) {
	return clubDAO.selectMatching(sqlSession,circle1_num);
	}
	
	
}
