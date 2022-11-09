package kr.co.mitgomukgo.market.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.market.dao.MarketDao;

@Service
public class MarketService {

	@Autowired
	private MarketDao dao;

	public MarketService() {
		super();
	}
}