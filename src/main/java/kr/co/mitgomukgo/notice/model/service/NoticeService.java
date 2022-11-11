package kr.co.mitgomukgo.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.notice.model.dao.NoticeDao;
import kr.co.mitgomukgo.notice.model.vo.Notice;
import kr.co.mitgomukgo.notice.model.vo.NoticeFile;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public HashMap<String, Object> selectAllNotice(int reqPage) {
		// 화면에 보여주는 게시물 수
		int numPerPage = 10;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		// 시작
		int start = (end - numPerPage) + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Notice> list = dao.selectAllNotice(map);
		
		int totalCnt = dao.selectNoticeCount();
		
		int totalPage = 0;
		if(totalCnt % numPerPage == 0) {
			totalPage = totalCnt / numPerPage;
		}else {
			totalPage = totalCnt / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = 1;
		
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi +=  "<a href='/selectNoticeList.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/selectNoticeList.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/selectNoticeList.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
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

	public int insertNotice(Notice notice, ArrayList<NoticeFile> fileList) {
		int result = dao.insertNotice(notice);
		if(result > 0) {
			int noticeNo = 0;
			
			if(!fileList.isEmpty()) {
				noticeNo = dao.selectMaxNotice();
				for(NoticeFile files : fileList) {
					files.setNoticeNo(noticeNo);
					result += dao.insertNoticeFile(files);
				}
			}
			
			
		}
		return result;
	}

	public Notice selectOneNotice(int noticeNo) {
		int result = dao.updateReadCount(noticeNo);
		
		Notice n = null;
		
		if(result > 0) {
			n = dao.selectOneNotice(noticeNo);
			ArrayList<NoticeFile> nfList = dao.selectALlNoticeFile(noticeNo);
			n.setFileList(nfList);
			return n;
		}else {
			return null;
		}
		
	}

	public NoticeFile selectOneNoticeFile(int noticeFileNo) {
		NoticeFile notice = dao.selectOneNoticeFile(noticeFileNo);
		return notice;
	}

	public int updateNotice(Notice n, int[] fileNoList) {
		int result = dao.updateNotice(n);
		
		if(result > 0) {
			
			// 추가한 파일이 있으면
			for(NoticeFile nf : n.getFileList()) {
				nf.setNoticeNo(n.getNoticeNo());
				result += dao.insertNoticeFile(nf);
			}
			
			// 삭제한 파일이 있다면
			if(fileNoList != null) {
				for(int fileNo : fileNoList) {
					result += dao.deleteNoticeFile(fileNo);
				}
			}
		}
		return result;
	}

	public ArrayList<NoticeFile> selectNoticeFile(int noticeNo) {
		ArrayList<NoticeFile> list = dao.selectALlNoticeFile(noticeNo);
		
		int result = 0;
		if(list != null) {
			result = dao.deleteNoticeFileList(noticeNo);
			if(result > 0) {
				result += dao.deleteNotice(noticeNo);
				}
				return list;
			}else {
				result = dao.deleteNotice(noticeNo);
				return null;
		}
		
	}

	public HashMap<String, Object> selectSearchNotice(String type, String keyword, int reqPage) {
		
		// 화면에 보이는 게시물 수
		int numPerPage = 10;
		
		// 끝페이지
		int end = reqPage * numPerPage;
		
		// 시작페이지
		int start = (end - numPerPage) + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Notice> list = dao.selectSearchNotice(map);
		
		int totalCount = dao.noticeSearchCount(map);
		
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = 1;
		
		String pageNavi = "";
		
		if(pageNo != 1) {
			pageNavi += "<a href='/searchNotice.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/searchNotice.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/searchNotice.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> pagemap = new HashMap<String, Object>();
		pagemap.put("list", list);
		pagemap.put("pageNavi", pageNavi);
		
		if(list == null) {
			return null;
		}else {
			return pagemap;
		}
	}
}



















