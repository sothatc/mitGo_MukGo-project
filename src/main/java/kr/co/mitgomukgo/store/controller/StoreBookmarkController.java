package kr.co.mitgomukgo.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mitgomukgo.store.model.service.StoreBookmarkService;
import kr.co.mitgomukgo.store.model.vo.StoreBookmark;

@Controller
public class StoreBookmarkController {
	@Autowired
	private StoreBookmarkService service;
	
	@ResponseBody
	@RequestMapping(value="/insertStoreBookmark.do", produces = "application/json;charset=utf-8")
	public String insertStoreBookmark(StoreBookmark sbm) {
		int result = service.insertStoreBookmark(sbm);
		
		if(result > 0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteStoreBookmark.do", produces = "application/json;charset=utf-8")
	public String deleteStoreBookmark(StoreBookmark sbm) {
		int result = service.deleteStoreBookmark(sbm);
		
		if(result > 0) {
			return "1";
		}else {
			return "0";
		}
	}
}
