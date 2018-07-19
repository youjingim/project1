package com.yj.project.model.service;

import java.util.List;

import com.yj.project.model.vo.Member;
import com.yj.project.model.vo.Memo;

public interface MemberService {
	int insertMember(Member member);
	Member loginCheck(String userId);
	List<Memo> memoLoding();
	int insertMemo(String memo,String password);
	int duplicateIdCheck(String userId);
}
