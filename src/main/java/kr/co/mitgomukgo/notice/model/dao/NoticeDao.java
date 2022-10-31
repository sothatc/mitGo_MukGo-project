package kr.co.mitgomukgo.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.notice.model.vo.Notice;

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
}
