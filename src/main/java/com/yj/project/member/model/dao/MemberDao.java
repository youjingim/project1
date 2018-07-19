package com.yj.project.member.model.dao;

import java.util.List;

import com.yj.project.member.model.vo.Member;
import com.yj.project.member.model.vo.Memo;

public interface MemberDao {
	int insertMember(Member member);
	Member loginCheck(String userId);
	List<Memo> memoLoding();
	int insertMemo(String memo,String password);
	int duplicateIdCheck(String userId);
}
