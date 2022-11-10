package kr.co.mitgomukgo.cart.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.member.model.vo.Member;
import java.util.List;

@Repository
public class CartDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	public ArrayList<Cart> allCartList(Member m) {
		 List list = sqlSession.selectList("cart.allCartList", m);
	      return (ArrayList<Cart>) list;
	   }
}
