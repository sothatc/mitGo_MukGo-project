package kr.co.mitgomukgo.market.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.market.model.vo.BookMark;

@Repository
public class BookmarkDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertBookMark(BookMark bm) {
		int result = sqlSession.insert("bookmark.insertBookmark", bm);
		return result;
	}

	public int deleteBookmark(BookMark bm) {
		int result = sqlSession.delete("bookmark.deleteBookmark", bm);
		return result;
	}

	public ArrayList<BookMark> myBookmarkList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("bookmark.myBookmarkList", map);
		
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<BookMark>)list;
		}
	}
}
