package kr.co.mitgomukgo.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.market.dao.BookmarkDao;
import kr.co.mitgomukgo.market.model.vo.BookMark;

@Service
public class BookmarkService {
	@Autowired
	private BookmarkDao dao;

	public int insertBookmark(BookMark bm) {
		int result = dao.insertBookMark(bm);
		return result;
	}

	public int deleteBookmark(BookMark bm) {
		int result = dao.deleteBookmark(bm);
		return result;
	}

	public HashMap<String, Object> myBookmarkList(String bookMarkId, int reqPage) {
		
		// 화면에 보이는 게시물 수 
		int numPerPage = 6;
		
		// 끝 페이지
		int end = numPerPage * reqPage;
		
		// 시작페이지
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end", end);
		map.put("start", start);
		map.put("bookMarkId", bookMarkId);
		
		ArrayList<BookMark> list = dao.myBookmarkList(map);
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("list", list);
		
		if(list == null) {
			return null;
		}else {
			return pageMap;
		}
	}
}
