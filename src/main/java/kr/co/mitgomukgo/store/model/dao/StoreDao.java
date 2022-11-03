package kr.co.mitgomukgo.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.member.model.vo.Owner;
import kr.co.mitgomukgo.store.model.vo.Menu;
import kr.co.mitgomukgo.store.model.vo.Review;
import kr.co.mitgomukgo.store.model.vo.Store;
import kr.co.mitgomukgo.store.model.vo.StoreImg;

@Repository
public class StoreDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public StoreDao() {
		super();
	}

	public int addStore(Store s) {
		return sqlSession.insert("store.addStore", s);
	}

	public int selectStoreNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("store.selectStoreNo");
	}

	public int insertImg(StoreImg si) {
		return sqlSession.insert("insertImg", si);
	}

	public int WriteReview(Review r) {
		return sqlSession.insert("reviewWrite", r);
	}

	public ArrayList<Store> storeList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("store.storeList",map);
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<Store>) list;	
		}
	}
	
	public int countAllList() {
		return sqlSession.selectOne("store.countAllList");
	}

	public int addMenu(Menu me) {
		return sqlSession.insert("addMenu", me);
	}

	/*
	public ArrayList<Store> storeTagList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("store.storeTagList",map);
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<Store>) list;	
		}
	}
	*/
	//모달 상세
	public Store selectOneStore(Store store) {
		Store s = sqlSession.selectOne("store.selectOneStore",store);
		return s;
	}

	public ArrayList<Store> selectStore(Owner o) {
		List s = sqlSession.selectList("store.selectMyStore",o);
		return (ArrayList<Store>) s;
	}

	public ArrayList<Store> selectTag(HashMap<String, Object> map) {
		List list = sqlSession.selectList("store.selectTag",map);
		return (ArrayList<Store>)list;
	}
	
	public int countTagList(String category) {
		return sqlSession.selectOne("store.countTagList",category);
	}
	
}