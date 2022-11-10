package kr.co.mitgomukgo.market.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.net.aso.p;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Market {
	private int pNo;
	private int ownerNo;
	private String pName;
	private int pPrice;
	private String pContent;
	private String pImg;
	private int storeNo;
}