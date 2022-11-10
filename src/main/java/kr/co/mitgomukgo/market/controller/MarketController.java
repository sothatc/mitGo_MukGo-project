package kr.co.mitgomukgo.market.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.market.model.service.MarketService;
import kr.co.mitgomukgo.market.model.vo.Market;
import kr.co.mitgomukgo.store.model.vo.Menu;
import kr.co.mitgomukgo.store.model.vo.Review;
import kr.co.mitgomukgo.store.model.vo.Store;

@Controller
public class MarketController {

	@Autowired
	private MarketService service;

	public MarketController() {
		super();
	}

	@RequestMapping(value = "/marketMain.do")
	public String marketMainFrm(int reqPage, Model model) {
		HashMap<String, Object>map = service.marketList(reqPage);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("reqPage",reqPage);
		
		return "market/marketMain";
	}
	
	//맛집 상세 이동
	@RequestMapping(value = "/marketDetailView.do")
	public String marketDetailView() {
		return "market/marketDetail";
	}
	
	
	
	// 맛집 상세 보기
	@RequestMapping(value = "/marketDetail.do")
	public String marketDetail(int storeNo, Model model) {
		Market ma = service.selectOneMarket(storeNo);
		model.addAttribute("ma", ma);
		return "market/marketDetail";
	}
	
}