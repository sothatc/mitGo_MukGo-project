package kr.co.mitgomukgo.store.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.store.model.dao.StoreDao;

@Service
public class StoreService {
	
	@Autowired
	private StoreDao dao;

	public StoreService() {
		super();
	}
}