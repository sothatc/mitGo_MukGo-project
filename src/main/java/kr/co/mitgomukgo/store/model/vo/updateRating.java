package kr.co.mitgomukgo.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Data
public class updateRating {
	private int storeNo;
	private double rating;
}
