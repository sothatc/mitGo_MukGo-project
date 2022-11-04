package kr.co.mitgomukgo.member.model.service;

import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import kr.co.mitgomukgo.member.model.dao.MemberDao;
import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.member.model.vo.Owner;
import kr.co.mitgomukgo.store.model.vo.Store;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public String checkId(String checkId) {
		String memberId = dao.checkId(checkId);
		return memberId;
	}

	public int insertMember(Member m) {
		
		return dao.insertMember(m);
	}

	public Member selectOneMember(Member member) {
		Member m = dao.selectOneMember(member);
		return m;
	}

	public int insertOwner(Owner o) {
		return dao.insertOwner(o);
	}

	public String ownerCheckId(String ownerCheckId) {
		String ownerId = dao.ownerCheckId(ownerCheckId);
		return ownerId;
	}

	public Owner selectOneOwner(Owner owner) {
		Owner o = dao.selectOneOwner(owner);
		return o;
	}

	public Store searchStore(int ownerNo) {
		Store s = dao.searchStore(ownerNo);
		return s;
	}


	
	
}
