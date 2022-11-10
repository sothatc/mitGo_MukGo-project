package kr.co.mitgomukgo.cart.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.cart.model.dao.CartDao;
import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.member.model.vo.Member;


@Service
public class CartService {
	@Autowired
	private CartDao dao;

	public ArrayList<Cart> allCartList(Member m) {
		ArrayList<Cart> list = dao.allCartList(m);
	      return (ArrayList<Cart>) list;
	   }
}
