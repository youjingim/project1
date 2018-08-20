package com.yj.project.search.model.service;

import java.util.List;

import com.yj.project.search.model.vo.Circle;
import com.yj.project.search.model.vo.Like;


public interface SearchService {

	int likeCount(int circle_num);
	
	int likeup(String member_id,int circle_num);
	
	int selectOne(Circle circle);
	
	List<Circle> searchCircle(String university,String circle_name,String Unsearch,int cPage,int numPerPage);
	
	
	//좋아요 순 동아리 랭킹
	List<Circle> circleList(Circle circle);
	
	
	//생성일 순 동아리 랭킹
	List<Circle> circleenroll(Circle circle);
	
	List<Circle> circleList2(Circle circle,int cPage,int numPerPage);

	int updateLike(int circle_num,int count);

	//좋아요 있는지 확인 작업
	int selectLike(String member_id,int circle_num);

	//좋아요 삭제
	int likeDown(String member_id,int circle_num);
	
	
	int deleteLike(int circle_num,int count);
	
	
	//List<Like> selectIDLike(String member_id);
	
	List<Circle> circleRank(Circle circle);
	
	List<Circle> circlePromotion(Circle circle);

	int selectCount();
	
	int selectCount2(String university,String circle_name,String Unsearch);

	Circle selectOneCircle(int circle_num);

	List<Circle> findOne(String Unsearch, String circle_name, int cPage, int numPerPage);

	int selectCount3(String Unsearch, String circle_name);
}
