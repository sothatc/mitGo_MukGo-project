package kr.co.mitgomukgo.store.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.store.model.dao.StoreBookmarkDao;
import kr.co.mitgomukgo.store.model.vo.StoreBookmark;

@Service
public class StoreBookmarkService {
	@Autowired
	private StoreBookmarkDao dao;

	public int insertStoreBookmark(StoreBookmark sbm) {
		int result = dao.insertStoreBookmark(sbm);
		return result;
	}

	public int deleteStoreBookmark(StoreBookmark sbm) {
		int result = dao.deleteStoreBookmark(sbm);
		return result;
	}
}
