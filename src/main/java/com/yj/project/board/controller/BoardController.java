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
import com.yj.project.board.model.vo.Attachment;
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
	
	@RequestMapping("/board/boardForm.do")
	public String boardForm() {
		return "board/boardForm";
		
	}
	@RequestMapping("/board/boardFormEnd.do")
	public ModelAndView insertBoard(Board board,@RequestParam(value="upFile",required=false)MultipartFile[] upfiles,HttpServletRequest req) {
		if(logger.isDebugEnabled()) {
			logger.debug("게시판 등록");
			logger.debug("param Board : "+board);
			logger.debug("첫번째파일 : "+upfiles[0].getName());
			logger.debug("첫번째원본파일이름 : "+upfiles[0].getOriginalFilename());
			logger.debug("첫번째 파일크기 : "+upfiles[0].getSize());
			logger.debug("두번째파일 : "+upfiles[1].getName());
			logger.debug("두번째원본파일이름 : "+upfiles[1].getOriginalFilename());
			logger.debug("두번째 파일크기 : "+upfiles[1].getSize());
			
		}
		String saveDir=req.getSession().getServletContext().getRealPath("/resources/upload/board");
		List<Attachment> attachmentList = new ArrayList<Attachment>();
		File dir = new File(saveDir);
		if(dir.exists()==false) System.out.println(dir.mkdirs());
		
		for(MultipartFile f : upfiles) {
			String originalFileName = f.getOriginalFilename();
			//확장자 구하기
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd_HHmmssSSS");
			int rndNum = (int)Math.random()*1000;
			String renamedFile = sdf.format(new Date(System.currentTimeMillis()));
			renamedFile +="_"+rndNum+"."+ext;
			
			try {
				f.transferTo(new File(saveDir+File.separator+renamedFile));
			}catch(IOException e) {
				e.printStackTrace();
			}
			Attachment attach = new Attachment();
			attach.setOriginalFileName(originalFileName);
			attach.setRenameFileName(renamedFile);
			attachmentList.add(attach);
		}
		
		int result = boardService.insertBoard(board,attachmentList);
		
		String msg="";
		String loc="/board/boardList.do";
		if(result>0) {
			msg="게시물 등록 성공";
		}else {
			msg="게시물 등록 실패";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("/common/msg");
		return mv;
		
	}
	@RequestMapping("/board/boardView.do")
	public String selectOneBoard(@RequestParam(value="no")int boardNo,Model model) {
		model.addAttribute("board",boardService.selectBoardOne(boardNo));
		model.addAttribute("attachList",boardService.selectAttchList(boardNo));
		return "/board/boardView";
	}
	@RequestMapping("/board/fileDownload.do")
	public void fileDownload(String oName, String rName, HttpServletRequest request, HttpServletResponse response)
	{
		logger.debug("원본명 : "+oName+"변경된 명 : "+rName);
		//스트림 생성
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;
		//저장경로
		String savedDir=request.getSession().getServletContext().getRealPath("/resources/upload/board");
		File savedFile=new File(savedDir+"/"+rName);
		try
		{
			FileInputStream fis=new FileInputStream(savedFile);
			bis=new BufferedInputStream(fis);
			sos=response.getOutputStream();
			
			String resFilename="";
			//브라우저 분기
			boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE")!=-1
					||request.getHeader("user-agent").indexOf("Trident")!=-1;
			if(isMSIE)
			{
				resFilename=URLEncoder.encode(oName, "UTF-8");
				resFilename=resFilename.replaceAll("\\", "%20");
			}
			else
			{
				resFilename=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			response.setContentType("application/otect-stream;charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment;filename=\""+resFilename+"\"");
			response.setContentLength((int)savedFile.length());

			//파일 읽어와서 전송하기
			int read=-1;
			while((read=bis.read())!=-1)
			{
				sos.write(read);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				sos.close();
				bis.close();
			}
			catch(IOException e)
			{
				e.printStackTrace();
			}
		}
		
		
		
	}

	
	
}
