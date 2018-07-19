package com.yj.project.search.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SearchPageController {

	@RequestMapping("secondPage.do")
	public String goSecond() {
		
		return "SecondPage/search";
	}

}
