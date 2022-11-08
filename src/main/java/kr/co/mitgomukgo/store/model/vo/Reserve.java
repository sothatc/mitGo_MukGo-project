package kr.co.mitgomukgo.store.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Reserve {

	private int reserveNo;
	private int memberNo;
	private int storeNo;
	private String storeName;
	private String reserveDate;
	private String eatDate;
	private String eatTime;
	private int eatNum;
	private String reserverName;
}
