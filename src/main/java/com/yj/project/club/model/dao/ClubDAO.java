package com.yj.project.club.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.CB_Comment;
import com.yj.project.club.model.vo.Circle_board;
import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.vo.Club;
import com.yj.project.member.model.vo.Member;

public interface ClubDAO {
	public Member selectOne(SqlSessionTemplate sqlSession, String id);
	public Club selectClub(SqlSessionTemplate sqlSession, int circle_num);
	public List<Member> selectMember(SqlSessionTemplate sqlSession, int circle_num,int cPage,int numPerPage);
	public int insertBudget(SqlSessionTemplate sqlSession,Budget b);
	public int insertBoard(SqlSessionTemplate sqlSession,Circle_board cb);
	public List<Circle_board> selectBoardList(SqlSessionTemplate sqlSession,int circle_num);
	public int deleteBoard(SqlSessionTemplate sqlSession,int cb_num);
	public Circle_board selectBoardOne(SqlSessionTemplate sqlSession,int no);
	public int updateBoard(SqlSessionTemplate sqlSession,Circle_board cb);
	public List<Matching> selectMatching(SqlSessionTemplate sqlSession,int circle1_num);
	public List<Budget> selectBudgetList(SqlSessionTemplate sqlSession,int circle_num,int cPage,int numPerPage);
	public int deleteCircleMember(SqlSessionTemplate sqlSession,String id);
	public int selectMemberCount(SqlSessionTemplate sqlSession,int circle_num);
	public int selectCountBudget(SqlSessionTemplate sqlSession,int circle_num);
	public int insertComment(SqlSessionTemplate sqlSession,CB_Comment c);
	public List<CB_Comment> commentList(SqlSessionTemplate sqlSession,int cb_num);
}
