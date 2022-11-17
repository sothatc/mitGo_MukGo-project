package kr.co.mitgomukgo.cart.model.service;

import java.util.ArrayList;
import java.util.StringTokenizer;

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

	

	public int insertCart(Cart c) {
		return dao.insertCart(c);
	}



	public ArrayList<Cart> cartList(String memberId) {
		ArrayList<Cart> list = dao.cartList(memberId);
		return (ArrayList<Cart>) list;
	}



	public ArrayList<Cart> ordercart(String memberId) {
		ArrayList<Cart> list = dao.ordercart(memberId);
		return list;
	}



	public boolean deleteCart(String delCartArr, String memberId) {
		
		StringTokenizer sT1 = new StringTokenizer(delCartArr, "/"); // 배열을 [/]를 기준으로 나눠 토큰(문자열)로 저장
		boolean result = true; // 레벨 변경이 성공했는지 저장할 변수
		
		while(sT1.hasMoreTokens()) { 
			
			int pNo = Integer.parseInt(sT1.nextToken());
			
			Cart c = new Cart();
			c.setPNo(pNo);
			c.setMemberId(memberId);
			int changeResult = dao.deleteCart(c);
			System.out.println(c);
			if (changeResult == 0) {
				result = false;
				break;
			}
		}
		return result;
	
	}



	/*
	 * public int deleteCart(int pNo) { // TODO Auto-generated method stub return
	 * dao.deleteCart(pNo); }
	 */
	public Cart searchCart(Cart c) {
		return dao.searchCart(c);
	}



	public int updateCart(Cart c) {
		return dao.updateCart(c);
	}




}
