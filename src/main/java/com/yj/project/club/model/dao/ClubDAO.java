package com.yj.project.club.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

<<<<<<< HEAD
import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.Circle_board;
=======
import com.yj.project.calendar.model.vo.Matching;
>>>>>>> 242f94d75172ce016f652882bbf477f4e0d174b5
import com.yj.project.club.model.vo.Club;
import com.yj.project.member.model.vo.Member;

public interface ClubDAO {
	public Member selectOne(SqlSessionTemplate sqlSession, String id);
	public Club selectClub(SqlSessionTemplate sqlSession, int circle_num);
	public List<Member> selectMember(SqlSessionTemplate sqlSession, int circle_num);
<<<<<<< HEAD
	public int insertBudget(SqlSessionTemplate sqlSession,Budget b);
	public int insertBoard(SqlSessionTemplate sqlSession,Circle_board cb);
	public List<Circle_board> selectBoardList(SqlSessionTemplate sqlSession,int circle_num);
	public int deleteBoard(SqlSessionTemplate sqlSession,int cb_num);
	public Circle_board selectBoardOne(SqlSessionTemplate sqlSession,int no);
	public int updateBoard(SqlSessionTemplate sqlSession,Circle_board cb);
=======
	public List<Matching> selectMatching(SqlSessionTemplate sqlSession,int circle1_num);
>>>>>>> 242f94d75172ce016f652882bbf477f4e0d174b5
}
