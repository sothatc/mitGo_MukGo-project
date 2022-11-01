package kr.co.mitgomukgo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.member.model.vo.Owner;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public String checkId(String checkId) {
		String memberId = sqlSession.selectOne("member.checkId",checkId);
		return memberId;
	}

	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember",m);
		return result;
	}

	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember",member);
		return m;
	}

	public int insertOwner(Owner o) {
		int result = sqlSession.insert("owner.insertOwner",o);
		return result;
	}

	public String ownerCheckId(String ownerCheckId) {
		String ownerId = sqlSession.selectOne("owner.ownerCheckId", ownerCheckId);
		return ownerId;
	}
	
}
