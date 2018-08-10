package com.yj.project.notice.model.service;

import java.util.List;

import com.yj.project.notice.model.vo.Notice;

public interface NoticeService {
	
	List<Notice> selectNoticeList(int cPage,int numPerPage);
	int selectCount();
	Notice noticeView(int boardNo);

}
