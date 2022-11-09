package kr.co.mitgomukgo.qna.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaFile {
	private int qnaFileNo;
	private int qnaNo;
	private String filename;
	private String filepath;
}
