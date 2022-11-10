package kr.co.mitgomukgo.cart.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.cart.model.service.CartService;
import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.member.model.vo.Member;



@Controller
public class CartController {
	@Autowired
	private CartService service;

	
	@RequestMapping(value="/cart.do")
	   public String cart(Model model, Member m) {
		  ArrayList<Cart> list = service.allCartList(m);
	      model.addAttribute("list",list);
	      return "market/cart";
	   }
	
}
