package kr.co.mitgomukgo.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private int orderNo;
	private int memberNo;
	private String orderDate;
	private int orderQuan;
	private String orderStatus;
	private String shippingName;
	private String shippingAddr;
	private String shippingPhone;
	private String impUid;
}
