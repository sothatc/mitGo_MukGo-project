package kr.co.mitgomukgo.store.model.vo;

import org.omg.CORBA.PRIVATE_MEMBER;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class StoreImg {
	private int storeImgNo;
	private int storeNo;
	private String imgpath;
}
