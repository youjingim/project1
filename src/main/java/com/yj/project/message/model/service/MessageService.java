package com.yj.project.message.model.service;

import java.util.List;

import com.yj.project.message.model.vo.Message;

public interface MessageService {
	public List<Message> selectReceiveList(String id,int cPage,int numPerPage);
	public int selectReceiveCount(String id);
	public List<Message> selectSendList(String id,int cPage,int numPerPage);
	public int selectSendCount(String id);
	public Message selectMessageOne(int message_num);
}
