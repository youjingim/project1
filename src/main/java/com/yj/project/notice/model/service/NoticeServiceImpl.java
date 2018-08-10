package com.yj.project.notice.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.notice.model.dao.NoticeDAO;
import com.yj.project.notice.model.service.NoticeService;
import com.yj.project.notice.model.service.NoticeServiceImpl;
import com.yj.project.notice.model.vo.Notice;
@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDAO noticeDAO;
	private Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	@Override
	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		
		return noticeDAO.selectNoticeList(cPage,numPerPage);
		
	}
	@Override
	public int selectCount() {
		return noticeDAO.selectCount();
	}
	@Override
	public Notice noticeView(int noticeNo) {
		
		return noticeDAO.noticeView(noticeNo);
	}

	
}
