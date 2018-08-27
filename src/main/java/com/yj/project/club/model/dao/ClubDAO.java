package com.yj.project.club.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.CB_Comment;
import com.yj.project.club.model.vo.Circle_board;
import com.yj.project.club.model.vo.Circle_join;
import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.vo.Club;
import com.yj.project.club.model.vo.ReqCircle;
import com.yj.project.club.model.vo.InnerLike;
import com.yj.project.member.model.vo.Member;
import com.yj.project.search.model.vo.Circle;

public interface ClubDAO {
	public Member selectOne(SqlSessionTemplate sqlSession, String id);
	public Club selectClub(SqlSessionTemplate sqlSession, int circle_num);
	public List<Member> selectMember(SqlSessionTemplate sqlSession, int circle_num,int cPage,int numPerPage);
	public List<Member> selectMember(SqlSessionTemplate sqlSession, int circle_num);
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
	public List<CB_Comment> commentList(SqlSessionTemplate sqlSession);
	public List<FinalWithus> selectClubMatching(SqlSessionTemplate sqlSession,int circle1_num);
	public List<ClubNotice> selectNotice(SqlSessionTemplate sqlSession,int circle1_num);
	public int countNotice(SqlSessionTemplate sqlSession,Map<String, Object> map);
	public int noticeUpdate(SqlSessionTemplate sqlSession,String member_id);
	public int selectGalleryList(SqlSessionTemplate sqlSession,int circle1_num);
	public List<String> selectG1(SqlSessionTemplate sqlSession,int circle_num);
	public List<String> selectG2(SqlSessionTemplate sqlSession,int circle_num);
	public int deleteComment(SqlSessionTemplate sqlSession,int no);
	public int createClub(SqlSessionTemplate sqlSession,ReqCircle club);
	public List<ReqCircle> selectClubCreate(SqlSessionTemplate sqlSession,int cPage, int numPerPage);
	public int pushLike(SqlSessionTemplate sqlSession,InnerLike like);
	public InnerLike selectLike(SqlSessionTemplate sqlSession,InnerLike like);
	public int updateDislike(SqlSessionTemplate sqlSession,InnerLike like);
	public int updateLike(SqlSessionTemplate sqlSession,InnerLike like);
	public List<InnerLike> selectLikeList(SqlSessionTemplate sqlSession,String member_id);
	public int updateLevel(SqlSessionTemplate sqlSession,Member mm);
	public CB_Comment selectComment(SqlSessionTemplate sqlSession,int no);

	public int clubCount(SqlSessionTemplate sqlSession);
	public ReqCircle makeClub(SqlSessionTemplate sqlSession,int circle_num);
	public int deleteCircle(SqlSessionTemplate sqlSession,int circle_num);
	public int insertCircle1(SqlSessionTemplate sqlSession,Club c);
	public int updateMemberLevel(SqlSessionTemplate sqlSession,Map<String, Object> map);
	public List<Club> selectClubList(SqlSessionTemplate sqlSession,int cPage,int numPerPage);
	public int circleCount(SqlSessionTemplate sqlSession);
	public int countMember(SqlSessionTemplate sqlSession,String member_id);
	public int deleteCircle(SqlSessionTemplate sqlSession,Map<String, Object> map);

	public int outCircle(SqlSessionTemplate sqlSession,String id);
	public Budget selectLastBud(SqlSessionTemplate sqlSession,int circle_num);
	public List<Budget> totalBud(SqlSessionTemplate sqlSession,int circle_num);
	public Member selectChairman(SqlSessionTemplate sqlSession,int circle_num);
	public int joinCircle(SqlSessionTemplate sqlSession,Circle_join join);
	public List<Circle_join> selectJoinList(SqlSessionTemplate sqlSession,Circle_join cj,int cPage, int numPerPage);
	public int selectJoinCount(SqlSessionTemplate sqlSession,Circle_join cj);
	public int inputMember(SqlSessionTemplate sqlSession,Circle_join cj);
	public int deleteJoinMember(SqlSessionTemplate sqlSession,Circle_join cj);
	
}
