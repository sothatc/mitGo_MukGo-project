package kr.co.mitgomukgo.cart.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.co.mitgomukgo.cart.model.service.CartService;
import kr.co.mitgomukgo.cart.model.vo.Cart;




@Controller
public class CartController {
	@Autowired
	private CartService service;
	
	   @RequestMapping(value="/insertCart.do")
	   public String insertCart(Cart c,int memberNo,Model model) {
	      int result = service.insertCart(memberNo, c);
	      return "redirect:/cart.do?memberId="+c.getMemberId();
	   }
	
	   
	   @RequestMapping(value="/cart.do")
		public String cart(Model model, Cart c) {
		   System.out.println(c);
			ArrayList<Cart> list = service.cartList(c);
			System.out.println(list);
			model.addAttribute("list",list);
			return "cart/cart";
		}
}



