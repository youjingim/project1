package com.yj.project.board.model.service;

import java.util.List;

import com.yj.project.board.model.vo.Board;

public interface BoardService {
	List<Board> selectBoardList(int cPage,int numPerPage);
	int selectCount();
	Board boardView(int boardNo);
	
}
