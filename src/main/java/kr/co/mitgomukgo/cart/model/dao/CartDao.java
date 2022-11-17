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



	public ArrayList<Cart> cartList(String memberId) {
		List list = sqlSession.selectList("cart.cartList", memberId);
		return (ArrayList<Cart>) list;
	}



	public ArrayList<Cart> ordercart(String memberId) {
		System.out.println("다오 들어옴");
		List list = sqlSession.selectList("cart.cartOrder", memberId);
		System.out.println("xml갔다옴"+list);
		return (ArrayList<Cart>) list;
	}



	public int deleteCart(Cart c) {
		return sqlSession.delete("cart.deleteCart", c);
	
	}



	/*
	 * public int deleteCart(int pNo) { int result =
	 * sqlSession.insert("cart.deleteCart", pNo); return result; }
	 */
	
	public Cart searchCart(Cart c) {
		return sqlSession.selectOne("searchCart", c);
	}



	public int updateCart(Cart c) {
		return sqlSession.update("updateCart", c);
	}





}
