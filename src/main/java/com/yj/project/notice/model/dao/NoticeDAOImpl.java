package com.yj.project.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yj.project.board.model.vo.Board;
import com.yj.project.notice.model.vo.Notice;
@Repository
public class NoticeDAOImpl implements NoticeDAO{
		@Autowired
		SqlSessionTemplate sqlSession;

	@Override
	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return sqlSession.selectList("notice.selectNoticeList",null,rb);
	}

	@Override
	public int selectCount() {
		return sqlSession.selectOne("notice.selectCount");
	}

	@Override
	public Notice noticeView(int noticeNo) {
		
		return sqlSession.selectOne("notice.selectView", noticeNo);
	}
	   @Override
	   public int noticeWrite(Notice notice) {
	      return sqlSession.insert("notice.noticeWrite",notice);
	   }
	   @Override
	   public int viewCount(int noticeNo) {
	      return sqlSession.update("notice.noticeViewUp",noticeNo);
	   }
	   @Override
	   public int noticeDelete(int noticeNo) {
		  return sqlSession.delete("notice.noticeDelete",noticeNo);
	}

	   @Override
	   public int noticeUpdateEnd(Notice notice) {
		  return sqlSession.update("notice.noticeUpdateEnd",notice);
	}

	}
