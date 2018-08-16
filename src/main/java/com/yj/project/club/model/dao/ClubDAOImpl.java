package com.yj.project.club.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.CB_Comment;
import com.yj.project.club.model.vo.Circle_board;
<<<<<<< HEAD
import com.yj.project.calendar.model.vo.Matching;

=======
import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
import com.yj.project.calendar.model.vo.Matching;
>>>>>>> 3f75b1efec7f3e43a9220e817bea8c7f88907544
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
<<<<<<< HEAD
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
	public List<CB_Comment> commentList(SqlSessionTemplate sqlSession, int cb_num) {
		return sqlSession.selectList("club.commentList", cb_num);
=======
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
>>>>>>> 3f75b1efec7f3e43a9220e817bea8c7f88907544
	}
	

}
