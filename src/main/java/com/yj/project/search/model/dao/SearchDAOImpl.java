package com.yj.project.search.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yj.project.search.model.vo.Circle;
import com.yj.project.search.model.vo.Like;
@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int likeCount(SqlSessionTemplate sqlSession,int circle_num) {
		return sqlSession.selectOne("search.likeCount",circle_num); 
		//select count(*) as cnt from like_table where con_code=?
	}

	
	@Override
	public int likeup(SqlSessionTemplate sqlSession, String member_id, int circle_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("circle_num", circle_num);
		map.put("member_id", member_id);
		
		return sqlSession.insert("search.likeup",map);
		//insert into like_table values(?,?,1)
	}
	

	@Override
	public int updateLike(SqlSessionTemplate sqlSession,int circle_num,int count) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("circle_num", circle_num);
		map.put("count", count);
		return sqlSession.update("search.updateLike",map);
		//값을 2개를 못받아 넘기므로 map을 처리
	}

	@Override
	public int deleteLike(SqlSessionTemplate sqlSession, int circle_num, int count) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("circle_num", circle_num);
		map.put("count", count);
		return sqlSession.update("search.deleteLike",map);
	}

	@Override
	public int selectOne(SqlSessionTemplate sqlSession,Circle circle) {
		return sqlSession.selectOne("search.selectOne",circle);
	}


	@Override
	public List<Circle> circleList(SqlSessionTemplate sqlSession,Circle circle) {
		return sqlSession.selectList("search.circleList",circle);
	}

	@Override
	public List<Circle> circleenroll(SqlSessionTemplate sqlSession, Circle circle) {
		System.out.println("1");
		return sqlSession.selectList("search.circleenroll",circle);
	}


	@Override
	public List<Circle> searchCircle(SqlSessionTemplate sqlSession,String university,String circle_name,String Unsearch,int cPage,int numPerPage) {
		
		List<Circle> search=null;
		//System.out.println("3");
		if(university!=null) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("cPage", cPage);
			map.put("numPerPage", numPerPage);
			map.put("university", university);
			RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage); 
			search=sqlSession.selectList("search.searchUniversity",map,rb);
		}else if(Unsearch!=null) {
			Unsearch="%"+Unsearch+"%";
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("cPage", cPage);
			map.put("numPerPage", numPerPage);
			map.put("Unsearch", Unsearch);
			RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage); 
			search=sqlSession.selectList("search.searchUnsearch",map,rb);
		}else {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("cPage", cPage);
			map.put("numPerPage", numPerPage);
			map.put("circle_name", circle_name);
			RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage); 
			//System.out.println("3.5");
			search=sqlSession.selectList("search.searchCircleName",map,rb);
			//System.out.println("3.9");
		}
		return search;
	}



	//좋아요 있는지 확인 작업
	@Override
	public int selectLike(SqlSessionTemplate sqlSession, String member_id, int circle_num) {
		//System.out.println("2번");
		Map<String,Object> map = new HashMap();
		map.put("circle_num", circle_num);
		map.put("member_id", member_id);
		System.out.println(map.get("member_id"));
		System.out.println(map.get("circle_num"));
		//System.out.println("3번");
		return sqlSession.selectOne("search.selectLike",map);
	}
	
	
	//좋아요 삭제
	@Override
	public int likeDown(SqlSessionTemplate sqlSession, String member_id, int circle_num) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("circle_num", circle_num);
		map.put("member_id", member_id);
		return sqlSession.delete("search.likeDown",map);
	}
	
	
	
	/*@Override
	public List<Like> selectIDLike(SqlSessionTemplate sqlSession, String member_id) {
		System.out.println("member_id");
		return sqlSession.selectList("search.selectIDLike",member_id);
	}*/

	//좋아요 많은순으로 정렬
	@Override
	public List<Circle> circleRank(SqlSessionTemplate sqlSession, Circle circle) {
		return sqlSession.selectList("search.circleRank",circle);
	}
	
	//동아리 홍보(좋아요 적은순으로 정렬)
	@Override
	public List<Circle> circlePromotion(SqlSessionTemplate sqlSession, Circle circle) {
		return sqlSession.selectList("search.circlePromotion",circle);
	}


	@Override
	public List<Circle> circleList2(SqlSessionTemplate sqlSession, Circle circle,int cPage,int numPerPage) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("circle", circle);
		map.put("cPage", cPage);
		map.put("numPerPage", numPerPage);
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage); 
		return sqlSession.selectList("search.circleList2",map,rb);
	}

	//총 갯수 표시
	@Override
	public int selectCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("search.selectCount");
	}
	
	@Override
	public int selectCount2(SqlSessionTemplate sqlSession,String university,String circle_name,String Unsearch) {
		
		int search=0;
		System.out.println("3");
		if(university!=null) {
			System.out.println("3.05");
			search=sqlSession.selectOne("search.selectUniversity",university);
			System.out.println("3.09");
		}else if(Unsearch!=null) {
			System.out.println("3.1");
			Unsearch="%"+Unsearch+"%";
			search=sqlSession.selectOne("search.selectUnsearch",Unsearch);
			System.out.println("3.2");
		}else {
			System.out.println("3.5");
			search=sqlSession.selectOne("search.selectCircleName",circle_name);
			System.out.println("3.9");
		}
		System.out.println("3.95");
		return search;
		
		/*System.out.println("------------------");
		System.out.println(university);
		System.out.println(circle_name);
		System.out.println(Unsearch);
		System.out.println("------------------");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("university", university);
		map.put("circle_name", circle_name);
		map.put("Unsearch", Unsearch);
		System.out.println("3.95");
		return sqlSession.selectOne("search.selectCount2",map);*/
	}


	//검색후 동아리 들어갈때
	@Override
	public Circle selectOneCircle(SqlSessionTemplate sqlSession, int circle_num) {
		return sqlSession.selectOne("search.selectOneCircle",circle_num);
	}

	//검색후에 다시 재검색 
	@Override
	public List<Circle> findOne(SqlSessionTemplate sqlSession, String Unsearch, String circle_name, int cPage,
			int numPerPage) {
		
		List<Circle> find= null;
		if(Unsearch!=null) {
			Unsearch="%"+Unsearch+"%";
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("cPage", cPage);
			map.put("numPerPage", numPerPage);
			map.put("Unsearch", Unsearch);
			RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage); 
			find=sqlSession.selectList("search.searchUnsearch",map,rb);
		}else {
			circle_name="%"+circle_name+"%";
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("cPage", cPage);
			map.put("numPerPage", numPerPage);
			map.put("circle_name", circle_name);
			RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage); 
			find=sqlSession.selectList("search.searchCircleName",map,rb);
		}
		
		return find;
	}


	@Override
	public int selectCount3(SqlSessionTemplate sqlSession, String Unsearch, String circle_name) {
		int search=0;
		System.out.println("3");
		if(Unsearch!=null) {
			Unsearch="%"+Unsearch+"%";
			search=sqlSession.selectOne("search.selectUnsearch",Unsearch);
		}else {
			System.out.println("3.5");
			circle_name="%"+circle_name+"%";
			search=sqlSession.selectOne("search.selectCircleName",circle_name);
			System.out.println("3.9");
		}
		return search;
	}
	
	

	
	


}
