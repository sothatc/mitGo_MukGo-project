package kr.co.mitgomukgo.market.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.market.model.service.MarketService;

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
}