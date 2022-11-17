package kr.co.mitgomukgo.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private int cartNo;
	private int pNo;
	private int cartQuan;
	private String pImg;
	private String pName;
	private int pPrice;
	private int orderPrice;
	private int orderNo;
	private String memberId;
	private String orderDate;
	private int orderQuan;
	private String orderStatus;
	private String shippingName;
	private String shippingAddr;
	private String shippingPhone;
	private String impUid;
}
