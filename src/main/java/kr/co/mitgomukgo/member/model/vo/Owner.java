package kr.co.mitgomukgo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Owner {
	private int ownerNo;
	private String ownerId;
	private String ownerPw;
	private String ownerName;
	private String ownerPhone;
	private String ownerEnrollDate;
	private int ownerLevel;
}
