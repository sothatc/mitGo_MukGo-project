package kr.co.mitgomukgo.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.store.model.service.StoreService;
import kr.co.mitgomukgo.store.model.vo.Store;

@Controller
public class StoreController {

	@Autowired
	private StoreService service;

	public StoreController() {
		super();
	}

	@RequestMapping(value = "addStoreFrm.do")
	public String addStoreFrm() {
		return "store/addStoreFrm";
	}

	@RequestMapping(value = "addStore.do")
	public String addStore(Store s) {
		return "redirect:/";
	}
}