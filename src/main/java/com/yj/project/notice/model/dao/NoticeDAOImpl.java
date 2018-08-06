package com.yj.project.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


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

	}
