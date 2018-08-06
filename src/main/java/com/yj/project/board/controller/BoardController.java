package com.yj.project.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yj.project.board.model.service.BoardService;

import com.yj.project.board.model.vo.Board;
import com.yj.project.common.page.PageCreate;
@Controller
public class BoardController {

	private Logger logger=LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board/boardList.do")
	public ModelAndView boardList(@RequestParam (value="cPage",required=false,defaultValue="1")int cPage) {
		if(logger.isDebugEnabled()) {
			logger.debug("게시판 목록페이지 시작" + cPage);
		}
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Board> list = boardService.selectBoardList(cPage,numPerPage);
		
		int totalCount = boardService.selectCount();
		
		String pageBar = new PageCreate().getPageBar(cPage,numPerPage,totalCount,"boardList.do");
		mv.addObject("list",list);
		mv.addObject("cPage",cPage);
		mv.addObject("totalCount",totalCount);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("/board/boardList");
		return mv;
	}
	@RequestMapping("/board/boardView.do")
	public ModelAndView boardView(@RequestParam(value="no") int boardNo) {

		ModelAndView mv = new ModelAndView();
		Board board = boardService.boardView(boardNo);
		mv.addObject("board",board);
		mv.setViewName("board/boardView");
		
		return mv;
	}
	
	@RequestMapping("/boardForm.do")
	public String boardForm() {

		
		return "board/boardForm";
<<<<<<< HEAD
	}
	
=======
	}	
>>>>>>> 46aea74b81f9fae36c3302f59f767276b2242b7f

}
