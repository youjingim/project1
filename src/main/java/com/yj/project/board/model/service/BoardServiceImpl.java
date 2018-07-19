package com.yj.project.board.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.board.model.dao.BoardDAO;
import com.yj.project.board.model.vo.Attachment;
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
	public int insertBoard(Board board,List<Attachment> attachmentList) {
		int result = 0;
		int boardNo = 0;
		try {
			result = boardDAO.insertBoard(board);
			boardNo = board.getBoardNo();
			logger.debug("boardNo : " + boardNo);
			if(attachmentList.size()>0) {
				for(Attachment a : attachmentList) {
					a.setBoardNo(boardNo);
					result = boardDAO.insertAttach(a);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return result;
	}
	@Override
	public Board selectBoardOne(int boardNo) {
		return boardDAO.selectBoardOne(boardNo);
	}
	@Override
	public List<Attachment> selectAttchList(int boardNo) {
		return boardDAO.selectAttchList(boardNo);
	}
	

}
