package kr.co.mitgomukgo.cart.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jdk.internal.org.objectweb.asm.tree.ParameterNode;
import kr.co.mitgomukgo.cart.model.service.CartService;
import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.market.model.vo.Market;
import kr.co.mitgomukgo.member.model.vo.Member;



@Controller
public class CartController {
	@Autowired
	private CartService service;
	
	   @RequestMapping(value="/insertCart.do")
	   public String insertCart(Cart c,int memberNo,Model model) {
	      int result = service.insertCart(memberNo, c);
	      return "redirect:/cart.do?memberNo="+c.getMemberNo();
	   }
	
	   
	   @RequestMapping(value="/cart.do")
		public String cart(Model model) {
			ArrayList<Cart> list = service.cartList();
			model.addAttribute("list",list);
			return "cart/cart";
		}
}



