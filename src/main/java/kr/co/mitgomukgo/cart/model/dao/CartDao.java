package kr.co.mitgomukgo.cart.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.market.model.vo.Market;
import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.store.model.vo.Menu;

import java.util.List;

@Repository
public class CartDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	
	public int insertCart(Cart c) {
		int result = sqlSession.insert("cart.insertCart", c);
		return result;
	}



	public ArrayList<Cart> cartList(Cart c) {
		List list = sqlSession.selectList("cart.cartList", c);
		return (ArrayList<Cart>) list;
	}



	public ArrayList<Cart> ordercart(Cart c, String memberId) {
		List list = sqlSession.selectList("order.ordercart", c);
		return (ArrayList<Cart>) list;
	}



	public Cart searchCart(Cart c) {
		return sqlSession.selectOne("searchCart", c);
	}



	public int updateCart(Cart c) {
		return sqlSession.update("updateCart", c);
	}





}
