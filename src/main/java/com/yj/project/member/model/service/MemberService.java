package com.yj.project.member.model.service;

import java.util.List;

import com.yj.project.member.model.vo.Member;

public interface MemberService {
	int insertMember(Member member);
	Member loginCheck(String userId);
	int insertMemo(String memo,String password);
	int duplicateIdCheck(String userId);
}
