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
	private String noticeWtriter;
	private String noticeContent;
	private String readCnt;
	private ArrayList<NoticeFile> fileList;
}
