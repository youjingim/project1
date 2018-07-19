package com.yj.project.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yj.project.board.model.vo.Attachment;
import com.yj.project.board.model.vo.Board;
@Repository
public class BoardDAOImpl implements BoardDAO{
		@Autowired
		SqlSessionTemplate sqlSession;

	@Override
	public List<Board> selectBoardList(int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return sqlSession.selectList("board.selectBoardList",null,rb);
	}

	@Override
	public int selectCount() {
		return sqlSession.selectOne("board.selectCount");
	}

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("board.insertBoard",board);
	}

	@Override
	public int insertAttach(Attachment attach) {
		return sqlSession.insert("board.insertAttach",attach);
	}

	@Override
	public Board selectBoardOne(int boardNo) {
		return sqlSession.selectOne("board.selectOne",boardNo);
	}

	@Override
	public List<Attachment> selectAttchList(int boardNo) {
		return sqlSession.selectList("board.selectAttach",boardNo);
	}



}
