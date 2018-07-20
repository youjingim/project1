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
	public int insertMemo(String memo, String password) {
		Map<String, String> memo1 = new HashMap<String, String>();
		memo1.put("memo", memo);
		memo1.put("password", password);
		return sqlSession.insert("project.insertMemo",memo1);
	}
	@Override
	public int duplicateIdCheck(String userId) {
		return sqlSession.selectOne("project.selectCheck",userId);
	}

	
}
