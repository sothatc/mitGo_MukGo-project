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
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("list", list);
		
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
}
























