package kr.co.mitgomukgo.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreBookmark {
	private int bmNo;
	private int storeNo;
	private String bookmarkId;
	private String imgPath;

}
