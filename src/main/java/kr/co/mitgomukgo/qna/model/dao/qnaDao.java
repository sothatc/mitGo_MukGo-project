package kr.co.mitgomukgo.qna.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.qna.model.vo.Qna;
import kr.co.mitgomukgo.qna.model.vo.QnaFile;

@Repository
public class qnaDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Qna> selectAllQna(HashMap<String, Object> map) {
		List list = sqlSession.selectList("qna.selectAllQna", map);
		
		if(!list.isEmpty()) {
			return (ArrayList<Qna>)list;
		}else {
			return null;
		}
	}

	public int insertQna(Qna q) {
		int result = sqlSession.insert("qna.insertQna", q);
		return result;
	}

	public int insertQnaFile(QnaFile qf) {
		int result = sqlSession.insert("qna.insertQnaFile", qf);
		return result;
	}

	public int selectMaxNo() {
		int result = sqlSession.selectOne("qna.selectMaxNo");
		return result;
	}

	public int upReadCnt(int qnaNo) {
		int result = sqlSession.update("qna.updateReadCnt", qnaNo);
		return result;
	}

	public Qna selectOneQna(int qnaNo) {
		Qna qna = sqlSession.selectOne("qna.selectOneQna", qnaNo);
		
		return qna;
	}

	public Qna selectQnaPassword(HashMap<String, Object> map) {
		Qna result = sqlSession.selectOne("qna.selectQnaPassword", map);
		return result;
	}

	public ArrayList<QnaFile> selectAllQnaFile(int qnaNo) {
		List list = sqlSession.selectList("qna.selectQnaFile", qnaNo);
		
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<QnaFile>)list;
		}
	}

	public QnaFile selectOneQnaFile(int qnaFileNo) {
		QnaFile qf = sqlSession.selectOne("qna.selectOneQnaFile", qnaFileNo);
		return qf;
	}

	public int updateQna(Qna qna) {
		int result = sqlSession.update("qna.updateQna", qna);
		return result;
	}

	public int deleteQnaFile(int fileNo) {
		int result = sqlSession.delete("qna.deleteQnaFile", fileNo);
		return result;
	}

	public int deleteQnaFileMan(int qnaNo) {
		int result = sqlSession.delete("qna.deleteQnaFileMan", qnaNo);
		return result;
	}

	public int deleteQna(int qnaNo) {
		int result = sqlSession.delete("qna.deleteQna", qnaNo);
		return result;
	}
}

























