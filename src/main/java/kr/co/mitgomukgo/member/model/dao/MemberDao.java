package kr.co.mitgomukgo.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.member.model.vo.Owner;
import kr.co.mitgomukgo.notice.model.vo.Notice;
import kr.co.mitgomukgo.order.model.vo.Order;
import kr.co.mitgomukgo.store.model.vo.Reserve;
import kr.co.mitgomukgo.store.model.vo.Store;

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

	public Owner selectOneOwner(Owner owner) {
		Owner o = sqlSession.selectOne("owner.selectOneOwner", owner);
		return o;
	}

	public Store searchStore(int ownerNo) {
		Store s = sqlSession.selectOne("store.searchStore", ownerNo);
		return s;
	}

	public int updateOwner(Owner o) {
		int result = sqlSession.update("owner.updateOwner", o);
		return result;
	}

	public int updateMember(Member m) {
		int result = sqlSession.update("member.updateMember",m);
		return result;
	}

	//예약관리
	public ArrayList<Reserve> selectReserveList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("reserve.selectReserveList",map);
		return (ArrayList<Reserve>) list;
	}

	//예약관리 총 개수
	public int countAllReserveList(int memberNo) {
		return sqlSession.selectOne("reserve.countAllReserveList",memberNo);
	}


	public ArrayList<Reserve> selectAllReserve(HashMap<String, Object> map) {
		List list = sqlSession.selectList("reserve.selectAllReserve", map);
		return (ArrayList<Reserve>) list;
	}

	public int countReserveList(int storeNo) {
		return sqlSession.selectOne("reserve.countReserveList",storeNo);
	}


	public ArrayList<Reserve> searchReserve(HashMap<String, Object> map) {
		List list = sqlSession.selectList("reserve.searchReserve", map);
		return (ArrayList<Reserve>) list;
	}
	
	public int cancleReserve(int reserveNo) {
		return sqlSession.delete("cancleReserve", reserveNo);
	}

	//최고관리자>업주관리
	public ArrayList<Owner> selectOwnerList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("owner.ownerList", map);
		return (ArrayList<Owner>) list;
	}
	
	//최고관리자 > 업주관리 (전체 업주수 조회)
	public int countAllOwner() {
		return sqlSession.selectOne("owner.countAllOwner");
	}
	
	//최고관리자 > 업주관리 > 검색기능
	public ArrayList<Owner> searchOwner(HashMap<String, Object> map) {
		List list = sqlSession.selectList("owner.searchOwner",map);
		return (ArrayList<Owner>) list;
	}
	//최고관리자 > 업주관리  > 검색기능 (글 개수 조회)
	public int searchOwnerCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("owner.searchOwnerCount", map);
		return result;
	}
	//최고관리자 > 업주관리 > 업주레벨 지정
	public int updateOwnerLevel(int ownerNo, Owner o) {
		int result = sqlSession.update("updateLevel", o);
		return result;
	}
	
	//최고관리자 > 업주관리 > 레벨 탭 
	public ArrayList<Owner> selectOwnerStatus(HashMap<String, Object> map) {
		List list = sqlSession.selectList("owner.ownerStatusList", map);
		return (ArrayList<Owner>) list;
	}

	
	//최고관리자 > 회원관리
	public ArrayList<Member> selectMemberList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("member.memberList", map);
		return (ArrayList<Member>) list;
	}
	
	//최고관리자 > 회원관리 (전체회원수 조회)
	public int countAllMember() {
		return sqlSession.selectOne("member.countAllMember");
	}
	
	//최고관리자 > 회원관리 > 검색기능
	public ArrayList<Member> searchMember(HashMap<String, Object> map) {
		List list = sqlSession.selectList("member.searchMember",map);
		return (ArrayList<Member>) list;
	}
	
	//최고관리자 > 회원관리 > 검색기능 (글 개수 조회)
	public int searchMemberCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("member.searchMemberCount", map);
		return result;
	}




	public int updateReserve(Reserve rs) {
		int result = sqlSession.update("reserve.updateReserve", rs);
		return result;
	}

	public Reserve selectOneReserve(int reserveNo) {
		Reserve reserve = sqlSession.selectOne("reserve.selectOneReserve", reserveNo);
		return reserve;
	}

	public Owner pwChkOwner(Owner owner) {
		return sqlSession.selectOne("owner.pwChkOwner", owner);
	}

	public Member pwChkMember(Member member) {
		return sqlSession.selectOne("member.pwChkMember", member);
	}

	public ArrayList<Notice> myPageNcList() {
		List list = sqlSession.selectList("notice.myPageNcList");
		return (ArrayList<Notice>)list;
	}

	public String searchMemberId(Member m) {
		return sqlSession.selectOne("member.searchMemberId",m);
	}

	public String searchOwnerId(Owner o) {
		return sqlSession.selectOne("owner.searchOwnerId", o);
	}

	public int searchNormalPw(Member member) {
		return sqlSession.selectOne("member.searchNormalPw", member);
	}

	public int updatePwMember(Member m) {
		return sqlSession.update("member.updateMember", m);
	}

	public int searchOwnerPw(Owner owner) {
		return sqlSession.selectOne("owner.searchOwnerPw",owner);
	}

	public int updatePwOwner(Owner o) {
		return sqlSession.update("owner.updatePwOwner",o);
	}

	public int deleteMember(int memberNo) {
		return sqlSession.delete("member.deleteMember", memberNo);
	}

	public ArrayList<Order> selectAllOrderList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("order.selectAllOrderList", map);
		return (ArrayList<Order>) list;
	}

	public int deleteOwner(int ownerNo) {
		return sqlSession.delete("owner.deleteOwner", ownerNo);
	}

	


	


	

}