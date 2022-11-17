package kr.co.mitgomukgo.store.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.member.model.vo.Owner;
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
	
	@RequestMapping(value="/selectAllStoreBookmark.do")
	public String selectAllStoreBookmark(@SessionAttribute Member m, int reqPage, Model model) {
		HashMap<String, Object> map = service.selectAllStoreBookmark(m, reqPage);
		
		if(map == null) {
			model.addAttribute("msg", "아직 찜한 맛집이 없습니다.");
			return "store/storeBookmarkList";
		}else {
			model.addAttribute("list", map.get("list"));
			model.addAttribute("pageNavi", map.get("pageNavi"));
			return "store/storeBookmarkList";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteStoreBookMarkNo.do", produces = "application/json;charset=utf-8")
	public String deleteStoreBookMarkNo(int bmNo) {
		int result = service.deleteStoreBookMarkNo(bmNo);
		
		if(result > 0) {
			return "1";
		}else {
			return "0";
		}
	}
}


















