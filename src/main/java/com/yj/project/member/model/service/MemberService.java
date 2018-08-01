package com.yj.project.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yj.project.member.model.vo.Member;

public interface MemberService {
	int insertMember(Member member);
	Member loginCheck(String userId);
	int duplicateIdCheck(String userId);
	String findPw(Map<String, String> map);
	String findId(Map<String, String> map);
	int selectEmail(Map<String, String> map);
	int selectId(Map<String, String> map);
}
