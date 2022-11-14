package kr.co.mitgomukgo.market.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookMark {
	private int bmNo;
	private int pNo;
	private String bookMarkId;
	private String pName;
	private int pPrice;
	private String pImg;
}
