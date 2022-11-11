package kr.co.mitgomukgo.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.market.dao.MarketDao;
import kr.co.mitgomukgo.market.model.vo.Market;

@Service
public class MarketService {

	@Autowired
	private MarketDao dao;

	public MarketService() {
		super();
	}

	public HashMap<String, Object> marketList(int reqPage) {
		int numPerPage = 9;
		
		int end = numPerPage * reqPage;
		int start = (end - numPerPage) + 1;
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("start",start);
		map.put("end",end);
		ArrayList<Market> list = dao.marketList(map);
		
		HashMap<String, Object> marketListMap = new HashMap<String, Object>();
		marketListMap.put("list",list);
		return marketListMap;
	}


	//마켓 상세 보기
	public Market selectOneMarket(int pNo) {
		Market ma = dao.selectOneMarket(pNo);
		
		return ma;
	}
	
	public int addMarketProduct(Market market) {
		return dao.addMarketProduct(market);
	}

	public ArrayList<Market> marketProductList(int storeNo) {
		return dao.marketProductList(storeNo);
	}

	public int deleteMarketProduct(int pNo) {
		return dao.deleteMarketProduct(pNo);
	}

	public Market readOneMarketProduct(int pNo) {
		return dao.readOneMarketProduct(pNo);
	}

	public int updateMarketProduct(Market market) {
		return dao.updateMarketProduct(market);
	}
	
}