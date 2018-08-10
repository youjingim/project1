package com.yj.project.club.model.service;

import java.util.List;

import com.yj.project.calendar.model.vo.Matching;
import com.yj.project.club.model.vo.Club;
import com.yj.project.member.model.vo.Member;

public interface ClubService {
	public Member selectOne(String id);
	public Club selectClub(int circle_num);
	public List<Member> selectMember(int circle_num);
	public List<Matching> selectMatching(int circle1_num);
}
