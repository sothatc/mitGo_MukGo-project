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
	   public String insertCart(Cart c, Model model) {
		  Cart cart = service.searchCart(c);
		  if(cart == null) {
			  int result = service.insertCart(c);
		  } else {
			  cart.setCartQuan(c.getCartQuan());
			  int result = service.updateCart(cart);
		  }
	      return "redirect:/cart.do?memberId="+c.getMemberId();
	   }
	
	   
	   @RequestMapping(value="/cart.do")
		public String cart(Model model, Cart c) {
			ArrayList<Cart> list = service.cartList(c);
			model.addAttribute("list",list);
			return "cart/cart";
		}
	   
	   @RequestMapping(value="/ordercart.do")
		public String ordercart(Model model, Cart c,String memberId) {
		   c.setMemberId(memberId);
		   System.out.println(c);
			ArrayList<Cart> list = service.ordercart(c, memberId);
			System.out.println(list);
			model.addAttribute("list",list);
			return "order/ordercart";
		}
	   
		
		
	   @RequestMapping(value="/deleteCart.do") public String deleteCart(String delCartArr,String memberId) {
		   boolean result = service.deleteCart(delCartArr, memberId);
			return "redirect:/cart.do?memberId="+memberId;
					
		}
		  
		 
		 
		  
		
		
}



