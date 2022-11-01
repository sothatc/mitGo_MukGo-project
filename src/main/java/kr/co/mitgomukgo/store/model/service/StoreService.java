package kr.co.mitgomukgo.store.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import kr.co.mitgomukgo.store.model.dao.StoreDao;
import kr.co.mitgomukgo.store.model.vo.Review;
import kr.co.mitgomukgo.store.model.vo.Store;
import kr.co.mitgomukgo.store.model.vo.StoreImg;

@Service
public class StoreService {

	@Autowired
	private StoreDao dao;

	public StoreService() {
		super();
	}

	public int addStore(Store s) {
		int result = dao.addStore(s);
		if (result > 0) {
			int storeNo = dao.selectStoreNo();
			for (StoreImg si : s.getStoreImgList()) {
				si.setStoreNo(storeNo);
				result += dao.insertImg(si);
			}
		}
		return result;
	}

	public int writeReview(Review r) {
		return dao.WriteReview(r);
	}

	public ArrayList<Store> storeList() {
		return dao.storeList();
	}

	//맛집 상세 모달로 가져오기
	public ArrayList<Store> ajaxSelectStore() {
		// TODO Auto-generated method stub
		return null;
	}
}