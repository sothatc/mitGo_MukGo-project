package kr.co.mitgomukgo.qna.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qna {
	private int qnaNo;
	private String qnaTitle;
	private String qnaWriter;
	private int secretStatus;
	private String qnaContent;
	private String qnaDate;
	private String qnaComment;
	private String qnaCommentWriter;
	private String commnetDate;
	private int commentStatus;
	private String qnaTheme;
	private int readCnt;
	private ArrayList<QnaFile> fileList;
}
