package kr.co.mitgomukgo.order.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.order.model.vo.Order;

@Repository
public class OrderDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int insertOrder(Order or) {
		int result = sqlSession.insert("order.insertOrder", or);
		return result;
	}


	public int orderNext(Order r) {
		System.out.println(r);
		int result = sqlSession.insert("order.nextOrder", r);
		return result;
	}



	




}
