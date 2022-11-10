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
	private String memberId;
	private int pNo;
	private int cartQuan;
	private String pImg;
	private String pName;
	private int pPrice;
	private Date cartDate;
	
}
