package kr.co.mitgomukgo.market.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.market.model.service.MarketService;

@Controller
public class MarketController {

	@Autowired
	private MarketService service;

	public MarketController() {
		super();
	}

	@RequestMapping(value = "/marketMainFrm.do")
	public String marketMainFrm() {
		return "market/marketMain";
	}
}