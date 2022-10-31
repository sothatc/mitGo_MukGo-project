package kr.co.mitgomukgo.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeFile {
	private int noticeFileNo;
	private int noticeNo;
	private String filename;
	private String filepath;
}
