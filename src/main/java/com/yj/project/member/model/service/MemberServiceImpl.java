package com.yj.project.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.member.model.dao.MemberDao;
import com.yj.project.member.model.vo.Member;
import com.yj.project.member.model.vo.Memo;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}
	@Override
	public Member loginCheck(String userId) {
		return memberDao.loginCheck(userId);
	}
	@Override
	public List<Memo> memoLoding() {
		
		return memberDao.memoLoding();
	}
	@Override
	public int insertMemo(String memo, String password) {
		return memberDao.insertMemo(memo,password);
	}
	@Override
	public int duplicateIdCheck(String userId) {
		return memberDao.duplicateIdCheck(userId);
	}
	

}
