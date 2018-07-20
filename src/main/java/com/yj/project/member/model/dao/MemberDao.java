package com.yj.project.member.model.dao;


import com.yj.project.member.model.vo.Member;

public interface MemberDao {
	int insertMember(Member member);
	Member loginCheck(String userId);
	int insertMemo(String memo,String password);
	int duplicateIdCheck(String userId);
}
