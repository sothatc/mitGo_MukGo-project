package kr.co.mitgomukgo.market.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mitgomukgo.market.model.service.BookmarkService;
import kr.co.mitgomukgo.market.model.vo.BookMark;

@Controller
public class BookMarkController {
	@Autowired
	private BookmarkService service;
	
	@ResponseBody
	@RequestMapping(value="/insertBookMark.do", produces = "application/json;charset=utf-8")
	public String insertBookmark(BookMark bm) {
		int result = service.insertBookmark(bm);
		
		if(result > 0) {
			return "0";
		}else {
			return "1";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteBookmark.do", produces = "application/json;charset=utf-8")
	public String deleteBookmarket(BookMark bm) {
		int result = service.deleteBookmark(bm);
		
		if(result > 0) {
			return "0";
		}else {
			return "1";
		}
	}
	
	@RequestMapping(value="/myBookmarkList.do")
	public String myBookmarkList(String bookMarkId, int reqPage, Model model) {
		HashMap<String, Object> map = service.myBookmarkList(bookMarkId, reqPage);
		
		if(map == null) {
			model.addAttribute("msg", "아직 찜한 목록이 없습니다.");
			return "market/myBookmarkList";
		}else {
			model.addAttribute("list", map.get("list"));
			return "market/myBookmarkList";
		}
	}
}




















