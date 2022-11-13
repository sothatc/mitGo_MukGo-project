package kr.co.mitgomukgo.qna.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.qna.model.dao.qnaDao;
import kr.co.mitgomukgo.qna.model.vo.Qna;
import kr.co.mitgomukgo.qna.model.vo.QnaFile;

@Service
public class qnaService {
	@Autowired
	private qnaDao dao;

	public HashMap<String, Object> selectAllQna(int reqPage) {
		
		// 화면에 보여주는 게시물 수
		int numPerPage = 10;
		
		// 페이지 끝페이지
		int end = reqPage * numPerPage;
		
		// 시작페이지
		int start = (end - numPerPage) + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end", end);
		map.put("start", start);
		
		ArrayList<Qna> list = dao.selectAllQna(map);
		
		// 전체 게시물 수
		int totalCount = dao.selectAllQnaCount();
				
		// 전체 페이지 수
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage + 1;
		}
				
		// 페이지 네비 수 이전  1 2 3 4 5
		int pageNaviSize = 5;
				
		// 페이지 번호
		int pageNo = 1;
				
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		// 페이지 네비게이션
		String pageNavi = "";
		
		if(pageNo != 1) {
			pageNavi += "<a href='/qnalist.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span class='pageNo'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/qnalist.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/qnalist.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("list", list);
		pageMap.put("pageNavi", pageNavi);
		
		if(list == null) {
			return null;
		}else {
			return pageMap;
		}
	}

	public int insertQna(Qna q) {
		int result = dao.insertQna(q);
		
		if(result > 0) {
			int qnaNo = dao.selectMaxNo();
			for(QnaFile qf : q.getFileList()) {
				qf.setQnaNo(qnaNo);
				result += dao.insertQnaFile(qf);
			}
		}
		return result;
	}

	public Qna qnaDetail(int qnaNo) {
		int result = dao.upReadCnt(qnaNo);
		Qna qna = null;
		if(result > 0) {
			qna = dao.selectOneQna(qnaNo);
			ArrayList<QnaFile> qf = dao.selectAllQnaFile(qnaNo);
			qna.setFileList(qf);
			return qna;
		}else {
			return null;
		}
		
		
	}

	public Qna selectQnaPassword(int qnaNo, String qnaPassword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qnaNo", qnaNo);
		map.put("qnaPassword", qnaPassword);
		
		Qna result = dao.selectQnaPassword(map);
		return result;
	}

	public QnaFile selectOneQnaFile(int qnaFileNo) {
		QnaFile qf = dao.selectOneQnaFile(qnaFileNo);
		return qf;
	}

	public int updateQna(Qna qna, int[] fileNoList) {
		int result = dao.updateQna(qna);
		
		if(result > 0) {
			for(QnaFile qf : qna.getFileList()) {
				qf.setQnaNo(qna.getQnaNo());
				result += dao.insertQnaFile(qf);
			}
			
			if(fileNoList != null) {
				for(int fileNo : fileNoList) {
					result += dao.deleteQnaFile(fileNo);
				}
			}
		}
		return result;
	}

	public ArrayList<QnaFile> deleteQna(int qnaNo) {
		
		ArrayList<QnaFile> list = dao.selectAllQnaFile(qnaNo);
		
		int result = 0;
		
		if(list != null) {
			result = dao.deleteQnaFileMan(qnaNo);
			if(result > 0) {
				result += dao.deleteQna(qnaNo);
			}
			return list;
		}else {
			result = dao.deleteQna(qnaNo);
			return null;
		}
		
		
	}

	public int insertComment(Qna qna) {
		int result = dao.inserComment(qna);
		return result;
	}

	public int updateComment(Qna qna) {
		int result = dao.updateComment(qna);
		return result;
	}

	public int deleteComment(int qnaNo) {
		int result = dao.deleteComment(qnaNo);
		return result;
	}

	public HashMap<String, Object> searchQna(int reqPage, String type, String keyword) {
		
		// 보여주는 게시물 수
		int numPerPage = 10;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		// 시작페이지
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end", end);
		map.put("start", start);
		map.put("keyword", keyword);
		map.put("type", type);
		
		ArrayList<Qna> list = dao.searchQna(map);
		
		int searchCount = dao.searchCnt(map);
		
		int totalPage = 0;
		if(searchCount % numPerPage == 0) {
			totalPage = searchCount / numPerPage;
		}else {
			totalPage = searchCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = 1;
		
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "";
		
		if(pageNo != 1) {
			pageNavi += "<a href='/searchQna.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageNo'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/searchQna.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/searchQna.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("list", list);
		pageMap.put("pageNavi", pageNavi);
		
		if(list == null) {
			return null;
		}else {
			return pageMap;
		}
		
	}

	public HashMap<String, Object> selectThemeQna(String qnaTheme, int reqPage) {
		
		// 화면에 보이는 게시물 수
		int numPerPage = 10;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		//시작 페이지
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end", end);
		map.put("start", start);
		map.put("qnaTheme", qnaTheme);
		
		ArrayList<Qna> list = dao.selectQnaTheme(map);
		
		int themeCnt = dao.selectQnaThemeCnt(qnaTheme);
		
		int totalPage = 0;
		if(themeCnt % numPerPage == 0) {
			totalPage = themeCnt / numPerPage;
		}else {
			totalPage = themeCnt / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = 1;
		
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "";
		
		if(pageNo != 1) {
			pageNavi += "<a href='/selectThemeqna.do?qnaTheme=" + qnaTheme + "&reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageNo'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/selectThemeqna.do?" + qnaTheme + "&reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/selectThemeqna.do?qnaTheme=" + qnaTheme + "&reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("list", list);
		pageMap.put("pageNavi", pageNavi);
		
		if(list == null) {
			return null;
		}else {
			return pageMap;
		}
		
	}

	public HashMap<String, Object> selectMyQnaList(int reqPage, String qnaWriter1) {
		
		// 화면에 보여지는 게시물 수
		int numPerPage = 10;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		// 시작페이지
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end", end);
		map.put("start", start);
		map.put("qnaWriter1", qnaWriter1);
		
		ArrayList<Qna> list = dao.selectMyQnaList(map);
		
		int totalCount = dao.qnaWriteCount(qnaWriter1);
		
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = 1;
		
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "";
		
		if(pageNo != 1) {
			pageNavi += "<a href='/selectMyQnaList.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageNo'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/selectMyQnaList.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/selectMyQnaList.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("list", list);
		pageMap.put("pageNavi", pageNavi);
		
		if(list == null) {
			return null;
		}else {
			return pageMap;
		}
		
	}
}
























