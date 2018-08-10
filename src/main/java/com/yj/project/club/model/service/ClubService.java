package com.yj.project.club.model.service;

import java.util.List;

import com.yj.project.club.model.vo.Budget;
import com.yj.project.club.model.vo.Circle_board;
import com.yj.project.club.model.vo.Club;
import com.yj.project.member.model.vo.Member;

public interface ClubService {
	public Member selectOne(String id);//로그인 한 회원정보 가져오는 로직
	public Club selectClub(int circle_num);//동아리 번호로 동아리에 대한 정보 가져오는 로직
	public List<Member> selectMember(int circle_num);//동아리 회원 목록 불러오는 로직
	public int insertBudget(Budget b);//동아리 예산 작성 로직
	public int insertBoard(Circle_board cb);//동아리 게시글 작성 로직
	public List<Circle_board> selectBoardList(int circle_num);//동아리 게시글 불러오는 로직
	public int deleteBoard(int no);//동아리 게시글 삭제 로직
	public Circle_board selectBoardOne(int no);//동아리 게시글 수정에 필요한 게시글 정보 가져오기
	public int updateBoard(Circle_board cb); //동아리 게시글 수정 로직
	
}
