package com.yj.project.board.model.service;

import java.util.List;

import com.yj.project.board.model.vo.Attachment;
import com.yj.project.board.model.vo.Board;

public interface BoardService {
	List<Board> selectBoardList(int cPage,int numPerPage);
	int selectCount();
	int insertBoard(Board board,List<Attachment> attachmentList);
	Board selectBoardOne(int boardNo);
	List<Attachment> selectAttchList(int boardNo);
	
}
