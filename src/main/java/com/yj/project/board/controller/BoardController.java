package com.yj.project.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
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
	public ModelAndView boardView(@RequestParam(value="no") int boardNo,HttpServletRequest request,HttpServletResponse response) {

		//조회수 증가!
		Cookie[] cookie=request.getCookies();
		String boardCookieVal="";
		boolean hasRead=false;
		//사이트 방문시에는 아무런 쿠키를 
		//갖고있지 않으면 cookie값은 null이 나옴
		if(cookie!=null)
		{
			outter:
				for(Cookie c : cookie)
				{
					String name=c.getName();
					String value=c.getValue();
					
					if("boardCookie".equals(name))
					{
						boardCookieVal=value;
						if(value.contains("|"+boardNo+"|"))
						{
							hasRead=true;
							break outter;
						}
					}
				}
		}
		
		if(!hasRead)
		{

			boardService.viewCount(boardNo);
			Cookie c=new Cookie("boardCookie",boardCookieVal+"|"+boardNo+"|");
			c.setMaxAge(-1);
			//브라우저가 닫는 경우 삭제
			response.addCookie(c);		
		}
		
		
		
		
		ModelAndView mv = new ModelAndView();
		Board board = boardService.boardView(boardNo);
		mv.addObject("board",board);
		mv.setViewName("board/boardView");
		
		return mv;
	}
	
	@RequestMapping("/boardForm.do")
	public String boardForm() {
		
		return "board/boardForm";
	}
	
	@RequestMapping("/board/boardWrite")
	public ModelAndView boardWrite(Board board){
		ModelAndView mv = new ModelAndView();
		
		int result = boardService.boardWrite(board);
		String msg="";
		String loc="/board/boardList.do";
		if(result>0) {
			msg="게시물 등록 성공!";
		}else {
			msg="게시물 등록 실패!";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		
		mv.setViewName("common/msg");
		
		return mv;
	}

}
