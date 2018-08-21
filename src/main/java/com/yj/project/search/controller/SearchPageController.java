package com.yj.project.search.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.sun.org.glassfish.gmbal.ParameterNames;
import com.yj.project.common.page.PageCreate;
import com.yj.project.search.model.service.SearchService;
import com.yj.project.search.model.vo.Circle;
import com.yj.project.search.model.vo.Like;


@Controller
public class SearchPageController {


	private Logger logger = LoggerFactory.getLogger(SearchPageController.class);
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("secondPage.do")
	public ModelAndView goSecond(@RequestParam(value="cPage",required=false, defaultValue="0") int cPage,String member_id,Circle circle) throws IOException {
		//페이징 처리
		int numPerPage=6;

		ModelAndView mav = new ModelAndView();
		
		if(cPage==0)
		{
			mav.addObject("flag","0");
			cPage=1;			
		}
		else {
			mav.addObject("flag","1");
		}
		
		List<Circle> list = searchService.circleList(circle);
		List<Circle> list2 = searchService.circleList2(circle,cPage,numPerPage);
		
		List<Circle> circleenroll = searchService.circleenroll(circle);
		
		int totalCount = searchService.selectCount();

		String pageBar=new PageCreate().getPageBar(cPage,numPerPage,totalCount,"secondPage.do");

		mav.addObject("pageBar",pageBar);
		mav.addObject("list",list);
		mav.addObject("list2",list2);
		mav.addObject("circleenroll", circleenroll);
		mav.addObject("totalCount",totalCount);
		mav.addObject("cPage",cPage);
		mav.setViewName("/SecondPage/search");

		return mav;
	}

	@RequestMapping("search/like.do")
	public void likeCount(HttpServletRequest req, HttpServletResponse res,int circle_num, String member_id) throws Exception {
	
		int count=0;
		int update=0;
		//System.out.println("시작!");
		int result=searchService.selectLike(member_id,circle_num);
		//System.out.println(result);
		//System.out.println("중간!");
		
		if(result>0) {
			//좋아요 취소
			int delete = searchService.likeDown(member_id,circle_num); //like_table의 좋아요 삭제
			count = searchService.likeCount(circle_num);   
			update = searchService.deleteLike(circle_num,count);//like_table의 좋아요 갯수 circle테이블로 업데이트(삭제)
			count = searchService.likeCount(circle_num);   //circle테이블의 좋아요 카운트
			//System.out.println("중간끝!");
		}else{
			//좋아요 추가	
			int insert = searchService.likeup(member_id,circle_num);  //like_table의 좋아요 추가
			count = searchService.likeCount(circle_num);   
			update = searchService.updateLike(circle_num,count);  //like_table의 좋아요 갯수 circle테이블로 업데이트(추가)
			count = searchService.likeCount(circle_num);   //circle테이블의 좋아요 카운트
		}
		
		System.out.println(result);

		
		
		new Gson().toJson(count,res.getWriter());
	}	
	
	@RequestMapping("search.do")
	public ModelAndView search(String university,String circle_name,String Unsearch,Model model,@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) {
		
		int numPerPage=5;
		
		circle_name="%"+circle_name+"%";
		//System.out.println("1");
		List<Circle> list = searchService.searchCircle(university,circle_name,Unsearch,cPage,numPerPage);
		/*System.out.println("-----");
		System.out.println(list);
		System.out.println("-----");
		System.out.println("----asdasdasdasad--------------");
		System.out.println(university);
		System.out.println(circle_name);
		System.out.println(Unsearch);
		System.out.println("------------------");*/
		int totalCount = searchService.selectCount2(university,circle_name,Unsearch);
		
		
		/*if(university==null && circle_name==null && Unsearch==null) {
			totalCount = searchService.selectCount();
		}
		else if(university !=null) {
			totalCount = searchService.uniCount();
		}
		else if(circle_name !=null) {
			totalCount = searchService.nameCount();
		}
		else {
			totalCount = searchService.unCount();
		}*/
		System.out.println("totalCount:"+totalCount);
		
		
		
		ModelAndView mav = new ModelAndView();
		String pageBar=null;
		if(university!=null) {
			pageBar=new PageCreate().getPageBar1(cPage,numPerPage,totalCount,university,"search.do");
		}else if(Unsearch!=null) {
			Unsearch = Unsearch.replace("%", "");
			pageBar=new PageCreate().getPageBar2(cPage,numPerPage,totalCount,Unsearch,"search.do");
		}else {
			circle_name = circle_name.replace("%", "");
			pageBar=new PageCreate().getPageBar3(cPage,numPerPage,totalCount,circle_name,"search.do");
		}
		
		mav.addObject("pageBar",pageBar);
		mav.addObject("list",list);
		mav.addObject("totalCount",totalCount);
		mav.addObject("cPage",cPage);
		mav.setViewName("/SecondPage/circleView");//어떤 jsp로 넘기는지
		return mav;
	}

	@RequestMapping("search/circleView.do")
	public String selectOne(@RequestParam(value="no") int circle_num,Model model) {
		
		model.addAttribute("circle",searchService.selectOneCircle(circle_num));
		
		
		return "clubPage/clubMain"; //해당 동아리 페이지화면 표시 부분으로 리턴

	}
	
	@RequestMapping("ListFinder.do")
	public ModelAndView findOne(String searchType,String Unsearch,String circle_name,@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) {
		
		int numPerPage=5;
		
		List<Circle> list = searchService.findOne(Unsearch,circle_name,cPage,numPerPage);
		
		int totalCount = searchService.selectCount3(Unsearch,circle_name);
		
		ModelAndView mav= new ModelAndView();
		String pageBar=null;
		if(Unsearch!=null) {
			Unsearch = Unsearch.replace("%", "");
			pageBar=new PageCreate().getPageBar5(cPage,numPerPage,totalCount,searchType,Unsearch,"ListFinder.do");
		}else { //searchType,keyword도 넘겨줘야함 페이징 처리에서 
			circle_name = circle_name.replace("%", "");
			pageBar=new PageCreate().getPageBar6(cPage,numPerPage,totalCount,searchType,circle_name,"ListFinder.do");
		}
		
		System.out.println("totalCount : "+totalCount);
		
		mav.addObject("pageBar",pageBar);
		mav.addObject("list",list);
		mav.addObject("totalCount",totalCount);
		mav.addObject("cPage",cPage);
		mav.setViewName("/SecondPage/circleView");
		
		return mav;
	}

	
	
}
