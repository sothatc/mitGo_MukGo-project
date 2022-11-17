package kr.co.mitgomukgo.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.order.model.service.OrderService;
import kr.co.mitgomukgo.order.model.vo.Order;

@Controller
public class OrderController {
 @Autowired
 private OrderService service;
 
 @RequestMapping(value="/insertOrder.do")
 public String insertOrder(Cart c ,Model model) {
    model.addAttribute("Order", c);
     return "order/order";
  }
 
 @RequestMapping(value = "/orderNext.do")
     public String orderNext(Order r, String shippingAddr1, String shippingAddr2, int[] pNo1, int[] orderQuan1) {
         r.setShippingAddr(shippingAddr1 + "*" + shippingAddr2);
         for (int i = 0; i < pNo1.length; i++) {
             r.setPNo(pNo1[i]);
             r.setOrderQuan(orderQuan1[i]);
             int result = service.orderNext(r);
         }
         System.out.println(r);
         return "order/ordercomplete";
     }
}