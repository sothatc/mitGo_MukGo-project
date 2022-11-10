package kr.co.mitgomukgo.market.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Market {
	private int pNo;
	private int ownerNo;
	private int storeNo;
	private String storeName;
	private String pName;
	private int pPrice;
	private String pContent;
	private String pImg;
	private int pCategory;
}