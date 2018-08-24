package com.yj.project.message.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.yj.project.message.model.vo.Message;

public interface MessageDAO {
	public List<Message> selectReceiveList(SqlSessionTemplate sqlSession, String id,int cPage,int numPerPage);
	public int selectReceiveCount(SqlSessionTemplate sqlSession, String id);
	public List<Message> selectSendList(SqlSessionTemplate sqlSession, String id,int cPage,int numPerPage);
	public int selectSendCount(SqlSessionTemplate sqlSession, String id);
	public Message selectMessageOne(SqlSessionTemplate sqlSession,int message_num);
}
