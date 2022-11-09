package kr.co.mitgomukgo.store.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class StoreJoin {
	private int storeNo; 
	private String storeName;
	private String openHour;
	private String address;
	private String phone;
	private String closedDay;
	private String category;
	private String content;
	private int storeImgNo;
	private String imgpath;
	private int maxNum;
}
