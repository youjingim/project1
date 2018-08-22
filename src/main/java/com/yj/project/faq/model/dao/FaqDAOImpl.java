package com.yj.project.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yj.project.board.model.vo.Board;
import com.yj.project.faq.model.dao.FaqDAO;
import com.yj.project.faq.model.vo.Faq;
@Repository
public class FaqDAOImpl implements FaqDAO {
    @Autowired
    SqlSessionTemplate sqlSession;
    
	   @Override
	   public List<Faq> selectFaqList() {
		      
		      return sqlSession.selectList("faq.selectFaqList");

}

	@Override
	public int faqUp(Map<String, Object> map) {
		return sqlSession.update("faq.faqUpdate",map);
	}
}
