package kr.co.mitgomukgo.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Review {
	private int reviewNo;
	private int storeNo;
	private String writer;
	private int rating;
	private String content;
	private String reviewImg;
	private String enrollDate;
}