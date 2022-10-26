package kr.co.mitgomukgo.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.mitgomukgo.store.model.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService service;

	public StoreController() {
		super();
	}
	
}
