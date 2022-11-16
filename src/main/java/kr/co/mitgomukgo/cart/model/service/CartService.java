package kr.co.mitgomukgo.cart.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.cart.model.dao.CartDao;
import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.market.model.vo.Market;
import kr.co.mitgomukgo.member.model.vo.Member;


@Service
public class CartService {
	@Autowired
	private CartDao dao;

	

	public int insertCart(int pNo, Cart c) {
		return dao.insertCart(c);
	}



	public ArrayList<Cart> cartList(Cart c) {
		ArrayList<Cart> list = dao.cartList(c);
		return (ArrayList<Cart>) list;
	}



	public ArrayList<Cart> ordercart(Cart c, String memberId) {
		ArrayList<Cart> list = dao.ordercart(c, memberId);
		return (ArrayList<Cart>) list;
	}
}
