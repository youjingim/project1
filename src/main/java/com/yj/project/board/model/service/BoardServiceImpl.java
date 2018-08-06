package com.yj.project.board.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.board.model.dao.BoardDAO;

import com.yj.project.board.model.vo.Board;
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDAO;
	private Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Override
	public List<Board> selectBoardList(int cPage, int numPerPage) {
		
		return boardDAO.selectBoardList(cPage,numPerPage);
		
	}
	@Override
	public int selectCount() {
		return boardDAO.selectCount();
	}
	@Override
	public Board boardView(int boardNo) {

		return boardDAO.boardView(boardNo);
	}

	


	
}
