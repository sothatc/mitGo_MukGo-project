package kr.co.mitgomukgo.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.member.model.vo.Owner;
import kr.co.mitgomukgo.store.model.dao.StoreDao;
import kr.co.mitgomukgo.store.model.vo.Menu;
import kr.co.mitgomukgo.store.model.vo.Reserve;
import kr.co.mitgomukgo.store.model.vo.Review;
import kr.co.mitgomukgo.store.model.vo.Store;
import kr.co.mitgomukgo.store.model.vo.StoreImg;
import kr.co.mitgomukgo.store.model.vo.StoreJoin;

@Service
public class StoreService {

	@Autowired
	private StoreDao dao;

	public StoreService() {
		super();
	}

	public int addStore(Store s) {
		int result = dao.addStore(s);
		if (result > 0) {
			int storeNo = dao.selectStoreNo();
			for (StoreImg si : s.getStoreImgList()) {
				si.setStoreNo(storeNo);
				result += dao.insertImg(si);
			}
		}
		return result;
	}

	public int writeReview(Review r) {
		return dao.WriteReview(r);
	}

	public HashMap<String, Object> storeList(int reqPage) {
		int numPerPage = 9;
		
		int end = numPerPage * reqPage;
		int start = (end - numPerPage) + 1;
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("start",start);
		map.put("end",end);
		
		ArrayList<Store> list = dao.storeList(map);
		//System.out.println(list);
		int totalPage = dao.countAllList();
		int pageNaviSize = 2;
		int pageNo = 1;
		
		if(reqPage > 2) {
			pageNo = reqPage - 1;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/storeList.do?reqPage=" +(pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/storeList.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(end <= totalPage) {
			pageNavi += "<a href='/storeList.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		HashMap<String, Object> storeListMap = new HashMap<String, Object>();
		storeListMap.put("list", list);
		storeListMap.put("reqPage", reqPage);
		storeListMap.put("pageNavi", pageNavi);
		storeListMap.put("total", totalPage);
		storeListMap.put("pageNo", pageNo);
		
		if(list == null) {
			return null;
		}else {
			return storeListMap;
		}
	}




	public int addMenu(Menu me) {
		return dao.addMenu(me);
	}


	public ArrayList<Store> selectStore(Owner o) {
		ArrayList<Store> s = dao.selectStore(o);
		return (ArrayList<Store>) s;
	}
	
	public HashMap<String, Object> selectTag(String category, int reqPage) {
		// 화면에 보여주는 게시물 수
		int numPerPage = 9;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		// 시작페이지
		int start = (end-numPerPage) + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		ArrayList<Store> list = dao.selectTag(map);

		int totalPage = dao.countTagList(category);
		int pageNaviSize = 2;
		int pageNo = 1;
		
		if(reqPage > 2) {
			pageNo = reqPage - 1;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/selectTag.do?category="+category+"&reqPage=" +(pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/selectTag.do?category="+category+"&reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(end <= totalPage) {
			pageNavi += "<a href='/selectTag.do?category="+category+"&reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		HashMap<String, Object> tagMap = new HashMap<String, Object>();
		tagMap.put("list", list);
		tagMap.put("reqPage", reqPage);
		tagMap.put("pageNavi", pageNavi);
		tagMap.put("total", totalPage);
		tagMap.put("pageNo", pageNo);
		
		return tagMap;
	}

	public HashMap<String, Object> searchStoreList(String search, int reqPage, String category) {
		// 화면에 보여주는 게시물 수
		int numPerPage = 9;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		// 시작페이지
		int start = (end-numPerPage) + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		map.put("category",category);
		
		ArrayList<Store> list = dao.searchStoreList(map);
		
		int totalPage = dao.countTagList(search);
		int pageNaviSize = 2;
		int pageNo = 1;
		
		if(reqPage > 2) {
			pageNo = reqPage - 1;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/storeList.do?reqPage=" +(pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/selectTag.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(end <= totalPage) {
			pageNavi += "<a href='/selectTag.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("list", list);
		searchMap.put("reqPage", reqPage);
		searchMap.put("pageNavi", pageNavi);
		searchMap.put("total", totalPage);
		searchMap.put("pageNo", pageNo);
		
		return searchMap;	
	}
	
	//맛집 상세
	public Store selectOneStore(int storeNo) {
		Store s = dao.selectOneStore(storeNo);
		return s;
	}
	
	//맛집 - 조인
	public ArrayList<StoreJoin> selectOneStoreAjax(StoreJoin sj) {
		ArrayList<StoreJoin> list = dao.selectOneStoreAjax(sj);
		return list;
	}


	//예약하기
	public int reserve(Reserve r) {
		return dao.reserve(r);
	}
	
	
	//예약된 시간 버튼 비활성화
	public ArrayList<Reserve> ajaxCheckReserve(Reserve r) {
		ArrayList<Reserve> list = dao.checkReserve(r);
		return list;
	}
	

	public ArrayList<Menu> menuList(int storeNo) {
		return dao.menuList(storeNo);

	}

	public int deleteMenu(int menuNo) {
		return dao.deleteMenu(menuNo);
	}

	public Menu readOneMenu(int menuNo) {
		return dao.readOneMenu(menuNo);
	}

	

	public int updateMenu(Menu menu) {
		return dao.updateMenu(menu);
	}
	

}