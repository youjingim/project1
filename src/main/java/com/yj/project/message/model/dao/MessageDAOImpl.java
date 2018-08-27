package com.yj.project.message.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yj.project.message.model.vo.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Override
	public List<Message> selectReceiveList(SqlSessionTemplate sqlSession, String id,int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("message.selectReceiveList",id,rb);
	}

	@Override
	public int selectReceiveCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("message.selectReceiveCount", id);
	}

	@Override
	public List<Message> selectSendList(SqlSessionTemplate sqlSession, String id, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("message.selectSendList",id,rb);
	}

	@Override
	public int selectSendCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("message.selectSendCount", id);
	}

	@Override
	public Message selectMessageOne(SqlSessionTemplate sqlSession, int message_num) {
		return sqlSession.selectOne("message.selectMessageOne", message_num);
	}
<<<<<<< HEAD

	@Override
	public int deleteMessage(SqlSessionTemplate sqlSession, int message_num) {
		return sqlSession.delete("message.deleteMessage", message_num);
	}

	@Override
	public int insertSend(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("message.insertSend", m);
	}
=======
>>>>>>> parent of 13248e6... Merge branch 'bonyeon' into second
	
}
