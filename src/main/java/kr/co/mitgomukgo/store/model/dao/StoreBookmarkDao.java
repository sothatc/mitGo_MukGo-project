package kr.co.mitgomukgo.store.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
