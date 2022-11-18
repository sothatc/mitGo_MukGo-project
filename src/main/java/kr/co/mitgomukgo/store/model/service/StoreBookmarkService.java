package kr.co.mitgomukgo.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.member.model.vo.Owner;
import kr.co.mitgomukgo.store.model.dao.StoreBookmarkDao;
import kr.co.mitgomukgo.store.model.vo.StoreBookmark;

@Service
public class StoreBookmarkService {
	@Autowired
	private StoreBookmarkDao dao;

	public int insertStoreBookmark(StoreBookmark sbm) {
		int result = dao.insertStoreBookmark(sbm);
		return result;
	}

	public int deleteStoreBookmark(StoreBookmark sbm) {
		int result = dao.deleteStoreBookmark(sbm);
		return result;
	}

	public HashMap<String, Object> selectAllStoreBookmark(Member m, int reqPage) {
		
		// 화면에 보여줄 게시물 수
		int numPerPage = 6;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		// 시작 페이지
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("bookmarkId", m.getMemberId());
		
		ArrayList<StoreBookmark> list = dao.selectAllBookmark(map);
		
		int totalCount = dao.selectBookmarkCnt(m.getMemberId());
		
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		// 페이지 네비 사이즈
		int pageNaviSize = 5;
		
		// 페이지 넘버
		int pageNo = 1;
		
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/selectAllStoreBookmark.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/selectAllStoreBookmark.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/selectAllStoreBookmark.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("list", list);
		pageMap.put("pageNavi", pageNavi);
		
		return pageMap;
	}

	public int deleteStoreBookMarkNo(int bmNo) {
		int result = dao.deleteStoreBookMarkNo(bmNo);
		return result;
	}
}


















