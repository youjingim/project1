package com.yj.project.board.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.project.board.model.dao.BoardDAO;

import com.yj.project.board.model.vo.Board;
import com.yj.project.board.model.vo.Comment;
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
   @Override
   public int boardWrite(Board board) {
      return boardDAO.boardWrite(board);
   }
   @Override
   public int viewCount(int boardNo) {
      return boardDAO.viewCount(boardNo);
   }

   @Override
   public int boardDelete(int boardNo) {
	  return boardDAO.boardDelete(boardNo);
}

   @Override
   public int boardUpdateEnd(Board board) {
	 return boardDAO.boardUpdateEnd(board);
}

   @Override
   public List<Board> boardSearch(String searchType, String searchForm,int cPage, int numPerPage) {
	return boardDAO.boardSearch(searchType,searchForm,cPage,numPerPage);
}

   @Override
   public int selectCount(String searchType, String searchForm) {
	return boardDAO.selectCount(searchType,searchForm);
}
   
   @Override
   public int commentInsert(String comment, int boardNum, String memberId) {
	return boardDAO.commentInsert(comment,boardNum,memberId);
}

   @Override
   public Comment selectComment(int boardNum) {
	return boardDAO.selectComment(boardNum);
}

   @Override
   public List<Comment> commentList(int boardNo) {
	return boardDAO.commentList(boardNo);
}

  
}
   
