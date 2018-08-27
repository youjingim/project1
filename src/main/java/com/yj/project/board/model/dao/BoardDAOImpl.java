package com.yj.project.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yj.project.board.model.vo.Board;
import com.yj.project.board.model.vo.Comment;
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

   @Override
   public int boardWrite(Board board) {
      return sqlSession.insert("board.boardWrite",board);
   }

   @Override
   public int viewCount(int boardNo) {
      return sqlSession.update("board.boardViewUp",boardNo);
   }

   @Override
   public int boardDelete(int boardNo) {
	  return sqlSession.delete("board.boardDelete",boardNo);
}

   @Override
   public int boardUpdateEnd(Board board) {
	  return sqlSession.update("board.boardUpdateEnd",board);
}

   @Override
   public List<Board> boardSearch(String searchType, String searchForm, int cPage, int numPerPage) {
	   Map<String, String> map = new HashMap<String, String>();
	   RowBounds rw = new RowBounds((cPage-1)*numPerPage,numPerPage);
	   map.put("searchType", searchType);
	   map.put("searchForm", searchForm);
	   return sqlSession.selectList("board.boardSearch",map,rw);

   
   
   
   }

   @Override
   public int selectCount(String searchType, String searchForm) {
	   Map<String, String> map = new HashMap<String, String>();
	   map.put("searchType", searchType);
	   map.put("searchForm", searchForm);
	   return sqlSession.selectOne("board.searchSelectCount",map);
}


   @Override
   public int commentInsert(String comment, int boardNum, String memberId) {
	   Map<String, Object> map= new HashMap<String, Object>();
	   map.put("comment", comment);
	   map.put("boardNum", boardNum);
	   map.put("memberId", memberId);
	   return sqlSession.insert("board.commentInsert",map);

   }


   @Override
   public Comment selectComment(int boardNum) {
	return sqlSession.selectOne("board.selectComment",boardNum);
}

   @Override
   public List<Comment> commentList(int boardNo) {
	return sqlSession.selectList("board.commentList",boardNo);
}

   @Override
   public int commentDelete(int commentNo) {
	return sqlSession.delete("board.commentDelete",commentNo);
}

}