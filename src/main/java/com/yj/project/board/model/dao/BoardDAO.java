package com.yj.project.board.model.dao;

import java.util.List;

import com.yj.project.board.model.vo.Board;

public interface BoardDAO {

	List<Board> selectBoardList(int cPage,int numPerPage);
	int selectCount();
	Board boardView(int boardNo);

<<<<<<< HEAD

=======
>>>>>>> 46aea74b81f9fae36c3302f59f767276b2242b7f
}
