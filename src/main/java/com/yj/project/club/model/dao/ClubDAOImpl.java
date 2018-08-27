package com.yj.project.club.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.CB_Comment;
import com.yj.project.club.model.vo.Circle_board;
import com.yj.project.club.model.vo.Circle_join;
import com.yj.project.calendar.model.vo.Matching;


import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
import com.yj.project.calendar.model.vo.Matching;

import com.yj.project.club.model.vo.Club;
import com.yj.project.club.model.vo.ReqCircle;
import com.yj.project.club.model.vo.InnerLike;
import com.yj.project.member.model.vo.Member;
import com.yj.project.search.model.vo.Circle;

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
	public List<Member> selectMember(SqlSessionTemplate sqlSession, int circle_num,int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("club.selectMember",circle_num,rb);
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

	@Override

	public int deleteCircleMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("club.deleteMember", id);
	}

	@Override
	public List<Budget> selectBudgetList(SqlSessionTemplate sqlSession, int circle_num,int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("club.selectBudgetList", circle_num,rb);
	}

	@Override
	public int selectMemberCount(SqlSessionTemplate sqlSession,int circle_num) {
		return sqlSession.selectOne("club.selectMemberCount",circle_num);
	}

	@Override
	public int selectCountBudget(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectOne("club.selectCountBudget", circle_num);
	}

	@Override
	public int insertComment(SqlSessionTemplate sqlSession, CB_Comment c) {
		return sqlSession.insert("club.insertComment", c);
	}

	@Override
	public List<CB_Comment> commentList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("club.commentList");
	}
	@Override
	public List<FinalWithus> selectClubMatching(SqlSessionTemplate sqlSession, int circle1_num) {
		return sqlSession.selectList("club.selectFinal",circle1_num);
	}

	@Override
	public List<ClubNotice> selectNotice(SqlSessionTemplate sqlSession, int circle1_num) {
		return sqlSession.selectList("club.selectNotice",circle1_num);
	}

	@Override
	public int countNotice(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("club.countNotice",map);
	}

	@Override
	public int noticeUpdate(SqlSessionTemplate sqlSession, String member_id) {
		return sqlSession.update("club.noticeUpdate",member_id);

	}

	@Override
	public List<Member> selectMember(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectList("club.selectMember", circle_num);
	}

	@Override
	public int selectGalleryList(SqlSessionTemplate sqlSession, int circle1_num) {
		return sqlSession.selectOne("club.selectGalleryList", circle1_num);
	}

	@Override
	public List<String> selectG1(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectList("club.selectG1", circle_num);
	}

	@Override
	public List<String> selectG2(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectList("club.selectG2", circle_num);
	}

	@Override
	public int deleteComment(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.delete("club.deleteComment", no);
	}

	@Override
	public int createClub(SqlSessionTemplate sqlSession, ReqCircle club) {
		return sqlSession.insert("club.createClub",club);
	}

	@Override
	public List<ReqCircle> selectClubCreate(SqlSessionTemplate sqlSession,int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("club.selectClubCreate",null,rb);
	}
	@Override
	public int pushLike(SqlSessionTemplate sqlSession, InnerLike like) {
		return sqlSession.insert("club.like_check", like);
	}

	@Override
	public InnerLike selectLike(SqlSessionTemplate sqlSession, InnerLike like) {
		return sqlSession.selectOne("club.selectLike", like);
	}

	@Override
	public int updateDislike(SqlSessionTemplate sqlSession, InnerLike like) {
		return sqlSession.update("club.updateDislike", like);
	}

	@Override
	public int updateLike(SqlSessionTemplate sqlSession, InnerLike like) {
		return sqlSession.update("club.updateLike", like);
	}

	@Override
	public List<InnerLike> selectLikeList(SqlSessionTemplate sqlSession, String member_id) {
		return sqlSession.selectList("club.selectLikeList", member_id);
	}

	@Override
	public int updateLevel(SqlSessionTemplate sqlSession, Member mm) {
		return sqlSession.update("club.updateLevel", mm);
	}

	@Override
	public CB_Comment selectComment(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("club.selectComment", no);
	}

	@Override	
	public int clubCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("club.clubCount");
	}

	@Override
	public ReqCircle makeClub(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectOne("club.selectReqClub",circle_num);
	}

	@Override
	public int deleteCircle(SqlSessionTemplate sqlSession,int circle_num) {
		return sqlSession.delete("club.deleteClub",circle_num);
	}

	@Override
	public int insertCircle1(SqlSessionTemplate sqlSession,Club c) {
		return sqlSession.insert("club.insertCircle",c);
	}

	@Override
	public int updateMemberLevel(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("club.updateMemberLevel",map);
	}

	@Override
	public List<Club> selectClubList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("club.selectClubList",null,rb);
	}

	@Override
	public int circleCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("club.circleCount");
	}

	@Override
	public int countMember(SqlSessionTemplate sqlSession, String member_id) {
		return sqlSession.selectOne("club.countMember",member_id);
	}

	@Override
	public int deleteCircle(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.delete("club.deletec",map);
	}
	
	

	@Override
	public int outCircle(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("club.outCircle", id);
	}

	@Override
	public Budget selectLastBud(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectOne("club.selectLastBud", circle_num);
	}

	@Override
	public List<Budget> totalBud(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectList("club.selectBudgetList", circle_num);
	}

	@Override
	public Member selectChairman(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectOne("club.selectChairman", circle_num);
	}

	@Override
	public int joinCircle(SqlSessionTemplate sqlSession, Circle_join join) {
		return sqlSession.insert("club.joinCircle", join);
	}

	@Override
	public List<Circle_join> selectJoinList(SqlSessionTemplate sqlSession, Circle_join cj, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("club.selectJoinList", cj, rb);
	}

	@Override
	public int selectJoinCount(SqlSessionTemplate sqlSession, Circle_join cj) {
		return sqlSession.selectOne("club.selectJoinCount", cj);
	}

	

}
