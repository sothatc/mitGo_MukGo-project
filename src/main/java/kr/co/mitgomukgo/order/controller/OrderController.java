package kr.co.mitgomukgo.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.order.model.service.OrderService;
import kr.co.mitgomukgo.order.model.vo.Order;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;

	@RequestMapping(value = "/insertOrder.do")
	public String insertOrder(Cart c, Model model) {
		model.addAttribute("Order", c);
		return "order/order";
	}

	@RequestMapping(value = "/orderNext.do")
	public String orderNext(Order r, String shippingAddr1, String shippingAddr2, int[] pNo1, int[] orderQuan1, @SessionAttribute Member m) {
		r.setShippingAddr(shippingAddr1 + "*" + shippingAddr2);
		int result = 0;
		for (int i = 0; i < pNo1.length; i++) {
			r.setPNo(pNo1[i]);
			r.setOrderQuan(orderQuan1[i]);
			result = service.orderNext(r);
		}
		if(result > 0) {
			System.out.println(m.getMemberId());
			int deleteResult = service.deleteCart(m.getMemberId());
		}
		return "order/ordercomplete";
	}

	@RequestMapping(value = "/orderDirect")
	public String orderDirect(Order r, String shippingAddr1, String shippingAddr2) {
		r.setShippingAddr(shippingAddr1 + "*" + shippingAddr2);
		int result = service.orderNext(r);
		return "order/ordercomplete";
	}

}