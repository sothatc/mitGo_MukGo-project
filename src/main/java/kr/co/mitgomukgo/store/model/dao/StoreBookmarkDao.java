package kr.co.mitgomukgo.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.store.model.vo.StoreBookmark;

@Repository
public class StoreBookmarkDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertStoreBookmark(StoreBookmark sbm) {
		int result = sqlSession.insert("storeBookmark.insertStoreBookmark", sbm);
		return result;
	}

	public int deleteStoreBookmark(StoreBookmark sbm) {
		int result = sqlSession.delete("storeBookmark.deleteStoreBookmark", sbm);
		return result;
	}

	public ArrayList<StoreBookmark> selectAllBookmark(HashMap<String, Object> map) {
		List list = sqlSession.selectList("storeBookmark.selectAllBookmark", map);
		
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<StoreBookmark>)list;
		}
	}

	public int selectBookmarkCnt(String memberId) {
		int result = sqlSession.selectOne("storeBookmark.selectBookmarkCnt", memberId);
		return result;
	}

	public int deleteStoreBookMarkNo(int bmNo) {
		int result = sqlSession.delete("storeBookmark.deleteStoreBookMarkNo", bmNo);
		return result;
	}

	
}
