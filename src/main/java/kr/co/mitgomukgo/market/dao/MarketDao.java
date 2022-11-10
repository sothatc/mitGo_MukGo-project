package kr.co.mitgomukgo.market.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.market.model.vo.Market;

@Repository
public class MarketDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public MarketDao() {
		super();
	}

	public ArrayList<Market> marketList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("market.marketList", map);
		return (ArrayList<Market>) list;
	}

	public int addMarketProduct(Market market) {
		return sqlSession.insert("addMarketProduct", market);
	}

	public ArrayList<Market> marketProductList(int storeNo) {
		List list = sqlSession.selectList("marketProductList", storeNo);
		return (ArrayList<Market>) list;
	}

}