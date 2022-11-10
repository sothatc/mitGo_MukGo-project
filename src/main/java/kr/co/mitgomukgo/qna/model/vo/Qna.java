package kr.co.mitgomukgo.qna.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qna {
	private int rNum;
	private int qnaNo;
	private String qnaTitle;  
	private String qnaWriter;
	private String qnaWriter1;
	private int secretStatus;
	private String qnaContent;
	private String qnaDate;
	private String qnaComment;
	private String qnaCommentWriter;
	private String commnetDate;
	private int commentStatus;
	private String qnaTheme;
	private int readCnt;
	private String qnaPassword;
	private ArrayList<QnaFile> fileList;
}
