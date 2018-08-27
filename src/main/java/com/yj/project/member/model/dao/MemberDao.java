package com.yj.project.member.model.dao;


import java.util.List;
import java.util.Map;

import com.yj.project.member.model.vo.Member;

public interface MemberDao {
	int insertMember(Member member);
	Member loginCheck(String userId);
	int duplicateIdCheck(String userId);
	String findPw(Map<String, String> map);
	String findId(Map<String, String> map);
	int selectEmail(Map<String, String> map);
	int selectId(Map<String, String> map);
	int updatePw(Map<String, String> map);
	int memberUpdate(Member member);
	int memberDelete(String member_pw);
	List<Member> selectMember(int cPage, int numPerPage);
	int selectCount();
	int levelChange(Map<String, String> map);
	int checkEmail(String email);
	List<Member> findById(int cPage, int numPerPage,String searchKeyword);
	int deleteMember(String member_id);
}
