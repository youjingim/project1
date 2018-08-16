package com.yj.project.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.member.model.dao.MemberDao;
import com.yj.project.member.model.vo.Member;
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
	public int duplicateIdCheck(String userId) {
		return memberDao.duplicateIdCheck(userId);
	}
	@Override
	public String findPw(Map<String, String> map) {
		return memberDao.findPw(map);
	}
	@Override
	public String findId(Map<String, String> map) {
		// TODO Auto-generated method stub
		return memberDao.findId(map);
	}
	@Override
	public int selectEmail(Map<String, String> map) {
		// TODO Auto-generated method stub
		return memberDao.selectEmail(map);
	}
	@Override
	public int selectId(Map<String, String> map) {
		// TODO Auto-generated method stub
		return memberDao.selectId(map);
	}
	@Override
	public int updatePw(Map<String, String> map) {
		// TODO Auto-generated method stub
		return memberDao.updatePw(map);
	}
	
	@Override
	public int memberUpdate(Member member) {
		// TODO Auto-generated method stub
		return memberDao.memberUpdate(member);
	}
	@Override
	public int memberDelete(String member_pw) {
		// TODO Auto-generated method stub
		return memberDao.memberDelete(member_pw);
	}
	@Override
	public List<Member> selectMember(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return memberDao.selectMember(cPage, numPerPage);
	}
	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return memberDao.selectCount();
	}
	@Override
	public int levelChange(Map<String, String> map) {
		// TODO Auto-generated method stub
		return memberDao.levelChange(map);
	}
	@Override
	public int checkEmail(Map<String, String> map) {
		// TODO Auto-generated method stub
		return memberDao.checkEmail(map);
	}

}
