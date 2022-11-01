package kr.co.mitgomukgo.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Menu {
	private int menuNo;
	private int storeNo;
	private String menuName;
	private int menuPrice;
	private String menuImg;
}