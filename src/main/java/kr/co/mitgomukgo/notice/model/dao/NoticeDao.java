package kr.co.mitgomukgo.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.notice.model.vo.Notice;
import kr.co.mitgomukgo.notice.model.vo.NoticeFile;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Notice> selectAllNotice(HashMap<String, Object> map) {
		List list = sqlSession.selectList("notice.selectAllNotice", map);
		
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<Notice>)list;
		}
		
	}

	public int insertNotice(Notice notice) {
		int result = sqlSession.insert("notice.insertNotice", notice);
		return result;
	}

	public int selectMaxNotice() {
		int result  = sqlSession.selectOne("notice.selectMaxNotice");
		return result;
	}

	public int insertNoticeFile(NoticeFile files) {
		int result = sqlSession.insert("notice.insertNoticeFile", files);
		return result;
	}

	public int selectNoticeCount() {
		int result = sqlSession.selectOne("notice.selectNoticeCount");
		return result;
	}

	public int updateReadCount(int noticeNo) {
		int result = sqlSession.update("notice.updateReadCount", noticeNo);
		return result;
	}

	public int selectReadCnt(int noticeNo) {
		int readCount = sqlSession.selectOne("notice.selectReadCount", noticeNo);
		return readCount;
	}

	public Notice selectOneNotice(int noticeNo) {
		Notice n = sqlSession.selectOne("notice.selectOneNotice", noticeNo);
		return n;
	}

	public ArrayList<NoticeFile> selectALlNoticeFile(int noticeNo) {
		List list = sqlSession.selectList("notice.selectAllNoticeFile", noticeNo);
		return (ArrayList<NoticeFile>)list;
	}

	public NoticeFile selectOneNoticeFile(int noticeFileNo) {
		NoticeFile notice = sqlSession.selectOne("notice.selectOneNoticeFile", noticeFileNo);
		return notice;
	}

	public int updateNotice(Notice n) {
		int result = sqlSession.update("notice.updateNotice", n);
		return result;
	}

	public int deleteNoticeFile(int fileNo) {
		int result = sqlSession.delete("notice.deleteNotice", fileNo);
		return result;
	}
}























