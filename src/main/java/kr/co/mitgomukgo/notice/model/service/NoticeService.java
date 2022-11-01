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
		int start = (end - numPerPage) - 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Notice> list = dao.selectAllNotice(map);
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("list", list);
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
}



















