package com.yj.project.club.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.Circle_board;
import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.vo.Club;
import com.yj.project.member.model.vo.Member;

public interface ClubDAO {
	public Member selectOne(SqlSessionTemplate sqlSession, String id);
	public Club selectClub(SqlSessionTemplate sqlSession, int circle_num);
	public List<Member> selectMember(SqlSessionTemplate sqlSession, int circle_num);
	public int insertBudget(SqlSessionTemplate sqlSession,Budget b);
	public int insertBoard(SqlSessionTemplate sqlSession,Circle_board cb);
	public List<Circle_board> selectBoardList(SqlSessionTemplate sqlSession,int circle_num);
	public int deleteBoard(SqlSessionTemplate sqlSession,int cb_num);
	public Circle_board selectBoardOne(SqlSessionTemplate sqlSession,int no);
	public int updateBoard(SqlSessionTemplate sqlSession,Circle_board cb);
	public List<Matching> selectMatching(SqlSessionTemplate sqlSession,int circle1_num);
	public List<FinalWithus> selectClubMatching(SqlSessionTemplate sqlSession,int circle1_num);
	public List<ClubNotice> selectNotice(SqlSessionTemplate sqlSession,int circle1_num);
	public int countNotice(SqlSessionTemplate sqlSession,Map<String, Object> map);
	public int noticeUpdate(SqlSessionTemplate sqlSession,String member_id);
}
