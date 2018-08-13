package com.yj.project.search.model.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;

import com.yj.project.search.model.vo.Circle;
import com.yj.project.search.model.vo.Like;

public interface SearchDAO {

	int likeCount(SqlSessionTemplate sqlSession,int circle_num); 
	
	int likeup(SqlSessionTemplate sqlSession,String member_id,int circle_num);
	
	int selectOne(SqlSessionTemplate sqlSession, Circle circle);
	
	List<Circle> searchCircle(SqlSessionTemplate sqlSession,String university,String circle_name,String Unsearch,int cPage,int numPerPage);
	
	
	int updateLike(SqlSessionTemplate sqlSession,int circle_num,int count);
	
	//좋아요 있는지 확인 작업
	int selectLike(SqlSessionTemplate sqlSession,String member_id,int circle_num);

	//좋아요 삭제
	int likeDown(SqlSessionTemplate sqlSession,String member_id,int circle_num);
	
	int deleteLike(SqlSessionTemplate sqlSession,int circle_num,int count);
	
	//List<Like> selectIDLike(SqlSessionTemplate sqlSession,String member_id);
	
	List<Circle> circleRank(SqlSessionTemplate sqlSession,Circle circle);

	List<Circle> circleList(SqlSessionTemplate sqlSession, Circle circle);
	
	//동아리 홍보(좋아요 역순으로 정렬)
	List<Circle> circlePromotion(SqlSessionTemplate sqlSession,Circle circle);
	
	List<Circle> circleList2(SqlSessionTemplate sqlSession,Circle circle,int cPage,int numPerPage);
	
	//총 갯수 표시
	int selectCount(SqlSessionTemplate sqlSession);
	
	int selectCount2(SqlSessionTemplate sqlSession,String university,String circle_name,String Unsearch);
	
	//하나의 동아리 선택(검색후)
	Circle selectOneCircle(SqlSessionTemplate sqlSession,int circle_num);

	List<Circle> findOne(SqlSessionTemplate sqlSession, String Unsearch, String circle_name, int cPage,int numPerPage);

	int selectCount3(SqlSessionTemplate sqlSession, String Unsearch, String circle_name);

}
