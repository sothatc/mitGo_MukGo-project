package kr.co.mitgomukgo.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.cart.model.service.CartService;



@Controller
public class CartController {
	@Autowired
	private CartService service;
	
	@RequestMapping(value="/cart.do")
	public String cart() {
		return "/order/cart";
	}
}
