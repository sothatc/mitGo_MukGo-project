package kr.co.mitgomukgo.cart.model.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int cartNo;
	private int memberNo;
	private String memberId;
	private int pNo;
	private int cartQuan;
	private Date cartDate;
	private int num;
	private String pImg;
	private String pName;
	private int pPrice;

	
}
