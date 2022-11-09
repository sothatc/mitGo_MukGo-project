package kr.co.mitgomukgo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import kr.co.mitgomukgo.member.model.dao.MemberDao;
import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.member.model.vo.Owner;
import kr.co.mitgomukgo.store.model.vo.Reserve;
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

	public int updateOwner(Owner o) {
		return dao.updateOwner(o);
	}

	public int updateMember(Member m) {
		return dao.updateMember(m);
	}

	public ArrayList<Reserve> selectReserveList(Member m) {
		ArrayList<Reserve> rs = dao.selectReserveList(m);
		return (ArrayList<Reserve>)rs;
	}

	public HashMap<String, Object> selectAllReserve(int reqPage, int storeNo) {
		// 화면에 보여주는 게시물 수
		int numPerPage = 10;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		// 시작페이지
		int start = (end-numPerPage) + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("storeNo", storeNo);
		ArrayList<Reserve> list = dao.selectAllReserve(map);
		
		int totalCnt = dao.countReserveList(storeNo);
		int totalPage = 0;
		if(totalCnt % numPerPage == 0) {
			totalPage = totalCnt / numPerPage;
		}else {
			totalPage = totalCnt / numPerPage + 1;
		}
		int pageNaviSize = 2;
		int pageNo = 1;
		
		if(reqPage > 2) {
			pageNo = reqPage - 1;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/reserveManage.do?reqPage=" +(pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/reserveManage.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(end <= totalPage) {
			pageNavi += "<a href='/reserveManage.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("list", list);
		searchMap.put("reqPage", reqPage);
		searchMap.put("pageNavi", pageNavi);
		searchMap.put("total", totalPage);
		searchMap.put("pageNo", pageNo);
		
		return searchMap;
	}

	public HashMap<String, Object> searchReserve(String keyword, int storeNo, int reqPage) {
		// 화면에 보여주는 게시물 수
		int numPerPage = 10;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		// 시작페이지
		int start = (end-numPerPage) + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		map.put("storeNo", storeNo);
		ArrayList<Reserve> list = dao.searchReserve(map);
		int totalCnt = dao.countReserveList(storeNo);
		int totalPage = 0;
		if(totalCnt % numPerPage == 0) {
			totalPage = totalCnt / numPerPage;
		}else {
			totalPage = totalCnt / numPerPage + 1;
		}
		int pageNaviSize = 2;
		int pageNo = 1;
		
		if(reqPage > 2) {
			pageNo = reqPage - 1;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/ownerReserveManage.do?reqPage=" +(pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/ownerReserveManage.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(end <= totalPage) {
			pageNavi += "<a href='/ownerReserveManage.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("list", list);
		searchMap.put("reqPage", reqPage);
		searchMap.put("pageNavi", pageNavi);
		searchMap.put("total", totalPage);
		searchMap.put("pageNo", pageNo);
		
		return searchMap;
	}

	public int cancleReserve(int reserveNo) {
		return dao.cancleReserve(reserveNo);
	}

	//최고관리자 > 업주관리
	public ArrayList<Owner> selectOwnerList(Owner o) {
		ArrayList<Owner> list = dao.selectOwnerList(o);
		return list;
	}

	//최고관리자 > 업주관리 > 업주레벨 지정
	public int updateOwnerLevel(int ownerNo, Owner o) {
		return dao.updateOwnerLevel(ownerNo,o);
	}

	//최고관리자 > 업주관리 > 레벨 탭 
	public ArrayList<Owner> selectOwnerStatus(Owner o, int ownerStatus) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("o",o);
		map.put("ownerStatus",ownerStatus);
		ArrayList<Owner> list = dao.selectOwnerStatus(map);
		return list;
	}
	
	//최고관리자 > 회원관리
	public ArrayList<Member> selectMemberList(Member m) {
		ArrayList<Member> list = dao.selectMemberList(m);
		return list;
	}


	
	
}
