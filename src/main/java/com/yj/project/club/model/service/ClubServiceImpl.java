package com.yj.project.club.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.dao.ClubDAO;
import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.CB_Comment;
import com.yj.project.club.model.vo.Circle_board;
import com.yj.project.club.model.vo.Club;
import com.yj.project.club.model.vo.ReqCircle;
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
	public List<Member> selectMember(int circle_num,int cPage, int numPerPage) {
		return clubDAO.selectMember(sqlSession,circle_num,cPage,numPerPage);
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
	public int deleteCircleMember(String id) {
		return clubDAO.deleteCircleMember(sqlSession,id);
	}

	@Override
	public List<Budget> selectBudgetList(int circle_num,int cPage, int numPerPage) {
		return clubDAO.selectBudgetList(sqlSession,circle_num,cPage,numPerPage);
	}

	@Override
	public int selectMemberCount(int circle_num) {
		return clubDAO.selectMemberCount(sqlSession,circle_num);
	}

	@Override
	public int selectCountBudget(int circle_num) {
		return clubDAO.selectCountBudget(sqlSession,circle_num);
	}

	@Override
	public int insertComment(CB_Comment c) {
		return clubDAO.insertComment(sqlSession,c);
	}

	@Override
	public List<CB_Comment> commentList() {
		return clubDAO.commentList(sqlSession);
	}
	@Override
	public List<Matching> selectMatching(int circle1_num) {
	return clubDAO.selectMatching(sqlSession,circle1_num);
	}

	@Override
	public List<FinalWithus> selectClubMatching(int circle1_num) {
		return clubDAO.selectClubMatching(sqlSession,circle1_num);
	}

	@Override
	public List<ClubNotice> selectNotice(int circle1_num) {
		return clubDAO.selectNotice(sqlSession,circle1_num);
	}

	@Override
	public int countNotice(Map<String, Object> map) {
		return clubDAO.countNotice(sqlSession,map);
	}

	@Override
	public int noticeUpdate(String member_id) {
		return clubDAO.noticeUpdate(sqlSession,member_id);
	}

	@Override
	public List<Member> selectMember(int circle_num) {
		return clubDAO.selectMember(sqlSession, circle_num);
	}

	@Override
	public int selectGalleryList(int circle_num) {
		return clubDAO.selectGalleryList(sqlSession,circle_num);
	}

	@Override
	public List<String> selectG1(int circle_num) {
		return clubDAO.selectG1(sqlSession,circle_num);
	}

	@Override
	public List<String> selectG2(int circle_num) {
		return clubDAO.selectG2(sqlSession,circle_num);
	}

	@Override
	public int deleteComment(int no) {
		return clubDAO.deleteComment(sqlSession,no);
	}

	@Override
	public int createClub(ReqCircle club) {
		return clubDAO.createClub(sqlSession,club);
	}

	@Override
	public List<ReqCircle> selectClubCreate() {
		return clubDAO.selectClubCreate(sqlSession);
	}
	
	
	
}
