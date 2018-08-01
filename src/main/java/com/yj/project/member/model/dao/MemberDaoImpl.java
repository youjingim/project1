package com.yj.project.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yj.project.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public int insertMember(Member member) {

		return sqlSession.insert("project.insertMember",member);
	}
	@Override
	public Member loginCheck(String userId) {
		return sqlSession.selectOne("project.selectOne",userId);
	}

	@Override
	public int duplicateIdCheck(String userId) {
		return sqlSession.selectOne("project.selectCheck",userId);
	}
	@Override
	public String findPw(Map<String, String> map) {
		return sqlSession.selectOne("project.findPw",map);
	}
	@Override
	public String findId(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("project.findId",map);
	}
	@Override
	public int selectEmail(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("project.selectEmail",map);
	}
	@Override
	public int selectId(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("project.selectId",map);
	}

	
}
