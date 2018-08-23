package com.yj.project.club.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.yj.project.calendar.model.vo.ClubNotice;
import com.yj.project.calendar.model.vo.FinalWithus;
import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.CB_Comment;
import com.yj.project.club.model.vo.Circle_board;
import com.yj.project.club.model.vo.Club;
import com.yj.project.club.model.vo.ReqCircle;
import com.yj.project.club.model.vo.InnerLike;
import com.yj.project.member.model.vo.Member;
import com.yj.project.search.model.vo.Circle;

public interface ClubService {
	public Member selectOne(String id);//로그인 한 회원정보 가져오는 로직
	public Club selectClub(int circle_num);//동아리 번호로 동아리에 대한 정보 가져오는 로직
	public List<Member> selectMember(int circle_num,int cPage, int numPerPage);//동아리 회원 목록 불러오는 로직
	public int insertBudget(Budget b);//동아리 예산 작성 로직
	public int insertBoard(Circle_board cb);//동아리 게시글 작성 로직
	public List<Circle_board> selectBoardList(int circle_num);//동아리 게시글 불러오는 로직
	public int deleteBoard(int no);//동아리 게시글 삭제 로직
	public Circle_board selectBoardOne(int no);//동아리 게시글 수정에 필요한 게시글 정보 가져오기
	public int updateBoard(Circle_board cb); //동아리 게시글 수정 로직
	public List<Member> selectMember(int circle_num);
	public int deleteCircleMember(String id); //동아리 회원 탈퇴 로직(사이트 탈퇴가 아님)
	public List<Budget> selectBudgetList(int circle_num,int cPage, int numPerPage); //예산 리스트를 불러오는 로직
	public int selectMemberCount(int circle_num);
	public List<Matching> selectMatching(int circle1_num);
	public int selectCountBudget(int circle_num);
	public int insertComment(CB_Comment c);
	public List<CB_Comment>commentList();
	public List<FinalWithus> selectClubMatching(int circle1_num);
	public List<ClubNotice> selectNotice(int circle1_num);
	public int countNotice(Map<String, Object> map);
	public int noticeUpdate(String member_id);
	public int selectGalleryList(int circle_num);
	public List<String> selectG1(int circle_num);
	public List<String> selectG2(int circle_num);
	public int deleteComment(int no);
	public int createClub(ReqCircle club);
	public List<ReqCircle> selectClubCreate(int cPage, int numPerPage);
	public int pushLike(InnerLike like);
	public InnerLike selectLike(InnerLike like);
	public int updateDislike(InnerLike like);
	public int updateLike(InnerLike like);
	public List<InnerLike> selectLikeList(String member_id);
	public int updateLevel(Member mm);
	public int clubCount();
	public ReqCircle makeClub(int circle_num);
	public int deleteCircle(int circle_num);
	public int insertCircle1(Club c);
	public int updateMemberLevel(Map<String, Object> map);
	public List<Club> selectClubList(int cPage,int numPerPage);
	public int circleCount();
	public int countMember(String member_id);
	
}
