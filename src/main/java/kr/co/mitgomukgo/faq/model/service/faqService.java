package kr.co.mitgomukgo.faq.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.faq.model.dao.faqDao;
import kr.co.mitgomukgo.faq.model.vo.Faq;

@Service
public class faqService {
	
	@Autowired
	private faqDao dao;

	public HashMap<String, Object> selectAllFaq(int reqPage) {
		
		// 화면에 보이는 게시물 수
		int numPerPage = 7;
		
		// reqPage = 1 이면
		// 1 2 3 4 5 6, 7
		// reqPage = 2 이면
		// 8 9 10 11 12 13 14
		// 끝
		int end = numPerPage * reqPage;
		// 끝
		int start = (end - numPerPage) + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Faq> list = dao.selectAllSelect(map);
		
		int totalPage = dao.countAllFaq();
		
		// 페이지 네비 사이즈
		int pageNaviSize = 2;
		
		// 페이지 시작 번호
		int pageNo = 1;
		
		if(reqPage > 2) {
			pageNo = reqPage - 1;
		}
		
		// 페이지 내비 시작
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/selectAllFaq.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/selectAllFaq.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		// 다음버튼
		if(end <= totalPage) {
			pageNavi += "<a href='/selectAllFaq.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		
		HashMap<String, Object> faqMap = new HashMap<String, Object>();
		faqMap.put("list", list);
		faqMap.put("reqPage", reqPage);
		faqMap.put("pageNavi", pageNavi);
		faqMap.put("total", totalPage);
		faqMap.put("pageNo", pageNo);
		
		if(list == null) {
			return null;
		}else {
			return faqMap;
		}
		
	}

	public int insertFaq(Faq faq) {
		
		return dao.insertFaq(faq);
	}

	public int deleteFaq(int faqNo) {
		
		return dao.deleteFaq(faqNo);
	}

	public Faq selectOneFaq(int faqNo) {
		
		return dao.selectOneFaq(faqNo);
	}

	public int updateFaq(Faq faq) {
		
		return dao.updateFaq(faq);
	}

	public HashMap<String, Object> selectThemeFaq(String faqTheme, int reqPage) {
		
		// 화면에 보여주는 게시물 수
		int numPerPage = 7;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		// 시작페이지
		int start = (end-numPerPage) + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Faq> list = dao.selectThemeFaq(faqTheme);
		
		HashMap<String, Object> themeMap = new HashMap<String, Object>();
		themeMap.put("list", list);
		themeMap.put("reqPage", reqPage);
		
		return themeMap;
	}

	public ArrayList<Faq> selectSearchFaq(String type, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		ArrayList<Faq> list = dao.selectSearchFaq(map);
		
		if(list == null) {
			return null;
		}else {
			return list;
		}
	}
}
























