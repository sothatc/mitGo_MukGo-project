package kr.co.mitgomukgo.market.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarketDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MarketDao() {
		super();
	}
	
}