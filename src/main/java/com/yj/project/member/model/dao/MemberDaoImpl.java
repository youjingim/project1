package com.yj.project.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

	@Override
	public int updatePw(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("project.updatePw",map);
	}
	
	@Override
	public int memberUpdate(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("project.memberUpdate",member);
	}
	@Override
	public int memberDelete(String member_pw) {
		// TODO Auto-generated method stub
		return sqlSession.delete("project.memberDelete",member_pw);
	}
	@Override
	public List<Member> selectMember(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("project.selectMember",null,rb);
	}
	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("project.selectCount");
	}
	@Override
	public int levelChange(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("project.levelChange",map);
	}
	@Override
	public int checkEmail(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("project.checkEmail",email);
	}
	@Override
	public List<Member> findById(int cPage, int numPerPage, String searchKeyword) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("project.findById",searchKeyword,rb);
	}

	
}
