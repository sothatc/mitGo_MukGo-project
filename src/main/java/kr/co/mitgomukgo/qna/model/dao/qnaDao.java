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
}
