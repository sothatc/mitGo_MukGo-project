package kr.co.mitgomukgo.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.store.model.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService service;

	public StoreController() {
		super();
	}
	
	//맛집 상세 보기 페이지 이동
	@RequestMapping(value="/storeDetailView.do")
	public String storeDetailView() {
		return "store/storeDetail";
	}
	
}
