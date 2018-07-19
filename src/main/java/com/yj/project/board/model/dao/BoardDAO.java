package com.yj.project.board.model.dao;

import java.util.List;

import com.yj.project.board.model.vo.Attachment;
import com.yj.project.board.model.vo.Board;

public interface BoardDAO {

	List<Board> selectBoardList(int cPage,int numPerPage);
	int selectCount();
	int insertBoard(Board board);
	int insertAttach(Attachment attach);
	Board selectBoardOne(int boardNo);
	List<Attachment> selectAttchList(int boardNo);
}
