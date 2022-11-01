package kr.co.mitgomukgo.notice.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int rnum;
	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private String readCnt;
	private String noticeDate;
	private ArrayList<NoticeFile> fileList;
}
