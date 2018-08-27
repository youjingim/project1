package com.yj.project.message.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.message.model.dao.MessageDAO;
import com.yj.project.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	public MessageDAO messageDAO;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public List<Message> selectReceiveList(String id,int cPage,int numPerPage) {
		return messageDAO.selectReceiveList(sqlSession,id,cPage,numPerPage);
	}
	@Override
	public int selectReceiveCount(String id) {
		return messageDAO.selectReceiveCount(sqlSession,id);
	}
	@Override
	public List<Message> selectSendList(String id, int cPage, int numPerPage) {
		return messageDAO.selectSendList(sqlSession,id,cPage,numPerPage);
	}
	@Override
	public int selectSendCount(String id) {
		return messageDAO.selectSendCount(sqlSession,id);
	}
	@Override
	public Message selectMessageOne(int message_num) {
		return messageDAO.selectMessageOne(sqlSession,message_num);
	}
	@Override
	public int deleteMessage(int message_num) {
		return messageDAO.deleteMessage(sqlSession,message_num);
	}
	@Override
	public int insertSend(Message m) {
		return messageDAO.insertSend(sqlSession,m);
	}
	
	
}
