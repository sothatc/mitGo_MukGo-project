package kr.co.mitgomukgo.faq.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.faq.model.vo.Faq;

@Repository
public class faqDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	public ArrayList<Faq> selectAllSelect(HashMap<String, Object> map) {
		List list = sqlsession.selectList("faq.selectAllFaq", map);
		
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<Faq>)list;
		}
	}

	public int insertFaq(Faq faq) {
		int result = sqlsession.insert("faq.insertFaq", faq);
		return result;
	}

	public int countAllFaq() {
		
		return sqlsession.selectOne("faq.countAllFaq");
	}

	public int deleteFaq(int faqNo) {
		int result = sqlsession.delete("faq.deleteFaq", faqNo);
		return result;
	}

	public Faq selectOneFaq(int faqNo) {
		Faq faq = sqlsession.selectOne("faq.selectOneFaq", faqNo);
		return faq;
	}

	public int updateFaq(Faq faq) {
		int result = sqlsession.update("faq.updateFaq", faq);
		return result;
	}

	public ArrayList<Faq> selectThemeFaq(String faqTheme) {
		List list = sqlsession.selectList("faq.selectThemeFaq", faqTheme);
		return (ArrayList<Faq>)list;
	}
}

















