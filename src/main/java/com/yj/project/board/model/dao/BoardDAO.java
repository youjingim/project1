package com.yj.project.board.model.dao;

import java.util.List;

import com.yj.project.board.model.vo.Board;
import com.yj.project.board.model.vo.Comment;

public interface BoardDAO {

   List<Board> selectBoardList(int cPage,int numPerPage);
   int selectCount();
   Board boardView(int boardNo);
   int boardWrite(Board board);
   int viewCount(int boardNo);
   int boardDelete(int boardNo);
   int boardUpdateEnd(Board board);
   List<Board> boardSearch(String searchType,String searchForm,int cPage,int numPerPage);
   int selectCount(String searchType,String searchForm);
   int commentInsert(String comment, int boardNum, String memberId);
   Comment selectComment(int boardNum);
   List<Comment> commentList(int boardNo);
}