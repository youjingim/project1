package com.yj.project.search.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.yj.project.search.model.dao.SearchDAO;
import com.yj.project.search.model.vo.Circle;
import com.yj.project.search.model.vo.Like;
@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDAO searchDAO;
	private Logger logger = LoggerFactory.getLogger(SearchServiceImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int likeCount(int circle_num) {
		return searchDAO.likeCount(sqlSession,circle_num);
	}

	@Override
	public int likeup(String member_id, int circle_num) {
		return searchDAO.likeup(sqlSession,member_id,circle_num);
		
	}

	@Override
	public int updateLike(int circle_num,int count) {
		return searchDAO.updateLike(sqlSession,circle_num,count);
	}



	@Override
	public int selectOne(Circle circle) {
		return searchDAO.selectOne(sqlSession,circle);
	}
	


	@Override
	public List<Circle> circleList(Circle circle) {
		return searchDAO.circleList(sqlSession,circle);
	}
	
	
	@Override
	public List<Circle> circleList2(Circle circle,int cPage, int numPerPage) {
		return searchDAO.circleList2(sqlSession,circle,cPage,numPerPage);
	}

	@Override
	public List<Circle> searchCircle(String university,String circle_name,String Unsearch,int cPage,int numPerPage) {
		//System.out.println("2");
		return searchDAO.searchCircle(sqlSession,university,circle_name,Unsearch,cPage,numPerPage);
	}


	//좋아요 있는지 확인 작업
	@Override
	public int selectLike(String member_id, int circle_num) {
		System.out.println("1번");
		return searchDAO.selectLike(sqlSession,member_id,circle_num);
	}
	
	//좋아요 삭제
	@Override
	public int likeDown(String member_id, int circle_num) {
		return searchDAO.likeDown(sqlSession,member_id,circle_num);
	}
	
	
	@Override
	public int deleteLike(int circle_num, int count) {
		return searchDAO.deleteLike(sqlSession,circle_num,count);
	}
	
	@Override
	public List<Circle> circleRank(Circle circle) {
		return searchDAO.circleRank(sqlSession,circle);
	}

	@Override
	public List<Circle> circlePromotion(Circle circle) {
		return searchDAO.circlePromotion(sqlSession,circle);
	}

	@Override
	public int selectCount() {
		return searchDAO.selectCount(sqlSession);
	}
	
	
	@Override
	public int selectCount2(String university,String circle_name,String Unsearch) {
		return searchDAO.selectCount2(sqlSession,university,circle_name,Unsearch);
	}

	
	//검색 리스트에서 다시 검색할때
	@Override
	public List<Circle> findOne(String Unsearch, String circle_name, int cPage, int numPerPage) {
		return searchDAO.findOne(sqlSession,Unsearch,circle_name,cPage,numPerPage);
	}

	//하나의 동아리 선택
	@Override
	public Circle selectOneCircle(int circle_num) {
		return searchDAO.selectOneCircle(sqlSession,circle_num);
	}
	
	//재검색때 동아리 수 카운트
	@Override
	public int selectCount3(String Unsearch, String circle_name) {
		return searchDAO.selectCount3(sqlSession,Unsearch,circle_name);
	}
	
	



	
	
	
	
	
	
	
}


