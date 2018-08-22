package com.yj.project.notice.model.dao;

import java.util.List;

import com.yj.project.board.model.vo.Board;
import com.yj.project.notice.model.vo.Notice;

public interface NoticeDAO {

	List<Notice> selectNoticeList(int cPage,int numPerPage);
	int selectCount();
	Notice noticeView(int noticeNo);
	int noticeWrite(Notice notice);
	   int viewCount(int noticeNo);
		int noticeUpdateEnd(Notice notice);
		int noticeDelete(int noticeNo);

}
