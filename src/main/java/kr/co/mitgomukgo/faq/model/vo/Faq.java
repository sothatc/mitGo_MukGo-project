package kr.co.mitgomukgo.faq.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Faq {
	private int rnum;
	private int faqNo;
	private String faqTheme;
	private String faqTitle;
	private String faqContent;
	
}
