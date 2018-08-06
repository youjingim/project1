package com.yj.project.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

<<<<<<< HEAD

=======
>>>>>>> 46aea74b81f9fae36c3302f59f767276b2242b7f
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
	public Board boardView(int boardNo) {
		return sqlSession.selectOne("board.selectView",boardNo);
	}

}
