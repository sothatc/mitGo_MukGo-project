package kr.co.mitgomukgo.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.notice.model.vo.Notice;
import kr.co.mitgomukgo.notice.model.vo.NoticeFile;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Notice> selectAllNotice(HashMap<String, Object> map) {
		List list = sqlSession.selectList("notice.selectAllNotice", map);
		
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<Notice>)list;
		}
		
	}

	public int insertNotice(Notice notice) {
		int result = sqlSession.insert("notice.insertNotice", notice);
		return result;
	}

	public int selectMaxNotice() {
		int result  = sqlSession.selectOne("notice.selectMaxNotice");
		return result;
	}

	public int insertNoticeFile(NoticeFile files) {
		int result = sqlSession.insert("notice.insertNoticeFile", files);
		return result;
	}
}
