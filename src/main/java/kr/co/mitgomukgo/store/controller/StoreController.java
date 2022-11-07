package kr.co.mitgomukgo.store.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileRename;
import kr.co.mitgomukgo.member.model.vo.Owner;
import kr.co.mitgomukgo.store.model.service.StoreService;
import kr.co.mitgomukgo.store.model.vo.Menu;
import kr.co.mitgomukgo.store.model.vo.Reserve;
import kr.co.mitgomukgo.store.model.vo.Review;
import kr.co.mitgomukgo.store.model.vo.Store;
import kr.co.mitgomukgo.store.model.vo.StoreImg;
import kr.co.mitgomukgo.store.model.vo.StoreJoin;

@Controller
public class StoreController {

	@Autowired
	private StoreService service;
	@Autowired
	private FileRename fileRename;

	// 맛집 상세 보기 페이지 이동
	@RequestMapping(value = "/storeDetailView.do")
	public String storeDetailView() {
		return "store/storeDetail";
	}

	// 맛집 상세 보기
	@RequestMapping(value = "/storeDetail.do")
	public String StoreDetail(int storeNo, Model model) {
		// ArrayList<Store> list = service.selectOneStore(storeNo);
		Store s = service.selectOneStore(storeNo);
		model.addAttribute("s", s);
		return "store/storeDetail";
	}

	// 맛집 이미지 배열로 가져오기
	@ResponseBody
	@RequestMapping(value = "/ajaxSelectStore.do", produces = "application/json;charset=utf-8")
	public String ajaxSelectStore(StoreJoin sj) {

		ArrayList<StoreJoin> list = service.selectOneStoreAjax(sj);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
	}

	// 예약하기
	@RequestMapping(value = "/reserve.do")
	public String StoreDetail(int memberNo, Reserve r) {
		int result = service.reserve(r);
		if (result > 0) {
			return "redirect:/";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/addStoreFrm.do")
	public String addStoreFrm() {
		return "store/addStoreFrm";
	}

	@RequestMapping(value = "/addStore.do")
	public String addStore(Store s, MultipartFile[] file, HttpServletRequest request, String zipCode,
			String detailAddress, String closedHour) {

		// 첨부이미지 목록 저장할 리스트 생성
		ArrayList<StoreImg> storeImgList = new ArrayList<StoreImg>();

		if (!file[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/store/");

			for (MultipartFile file2 : file) {
				String filename = file2.getOriginalFilename();
				String imgpath = fileRename.fileRename(savePath, filename);
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + imgpath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file2.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				StoreImg storeImg = new StoreImg();
				storeImg.setImgpath(imgpath);
				storeImgList.add(storeImg);
			}
		}
		s.setStoreImgList(storeImgList);
		s.setAddress(zipCode + "*" + s.getAddress() + "*" + detailAddress);
		s.setOpenHour(s.getOpenHour() + "~" + closedHour);
		int result = service.addStore(s);
		return "redirect:/storeList.do?reqPage=1";
	}

	@RequestMapping(value = "/storeList.do")
	public String storeListFrm(int reqPage, Model model) {
		HashMap<String, Object> map = service.storeList(reqPage);

		if (map == null) {
			model.addAttribute("msg", "아직 등록된 업체 가 없습니다.");
			return "store/storeListFrm";
		} else {
			model.addAttribute("list", map.get("list"));
			model.addAttribute("reqPage", reqPage);
			model.addAttribute("pageNavi", map.get("pageNavi"));
			model.addAttribute("total", map.get("total"));
			model.addAttribute("pageNo", map.get("pageNo"));
			return "store/storeListFrm";
		}
		// ArrayList<Store> list = service.storeList();
	}

	@RequestMapping(value = "/writeReviewFrm.do")
	public String writeReviewFrm() {
		return "store/writeReviewFrm";
	}

	@RequestMapping(value = "/writeReview.do")
	public String writeReview(Review r, MultipartFile reviewImgName, HttpServletRequest request) {
		if (!reviewImgName.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/review/");
			String filename = reviewImgName.getOriginalFilename();
			String imgpath = fileRename.fileRename(savePath, filename);
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + imgpath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = reviewImgName.getBytes();
				bos.write(bytes);
				bos.close();
				r.setReviewImg(imgpath);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int result = service.writeReview(r);
		return "store/successReivewFrm";
	}

	@RequestMapping(value = "/menuFrm.do")
	public String menuFrm(@SessionAttribute Store s, Model model) {
		ArrayList<Menu> list = service.menuList(s.getStoreNo());
		model.addAttribute("list", list);
		return "store/menuFrm";
	}

	@RequestMapping(value = "/addMenuFrm.do")
	public String addMenuFrm() {
		return "store/addMenuFrm";
	}

	@RequestMapping(value = "/addMenu.do")
	public String addMenu(Menu me, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/menu/");
			String imgName = file.getOriginalFilename();
			String menuPath = fileRename.fileRename(savePath, imgName);
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + menuPath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			me.setMenuImg(menuPath);
		}
		int result = service.addMenu(me);
		return "redirect:/menuFrm.do";
	}

	@RequestMapping(value = "/deleteMenu.do")
	public String deleteMenu(int menuNo, HttpServletRequest request) {
		int result = service.deleteMenu(menuNo);
		if(result > 0) {
			return "redirect:/menuFrm.do";
		} else {
			request.setAttribute("msg", "삭제시 문제가 발생했습니다.");
			request.setAttribute("url", "/menuFrm.do");
			return "common/alert";
		}
	}
	
	@RequestMapping(value = "/updateMenuFrm.do")
	public String updateMenuFrm(int menuNo, Model model) {
		Menu me = service.readOneMenu(menuNo);
		model.addAttribute("me", me);
		return "store/updateMenuFrm";
	}
	
	@RequestMapping(value = "/updateMenu.do")
	public String updateMenu(Menu menu, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/menu/");
			String imgName = file.getOriginalFilename();
			String menuPath = fileRename.fileRename(savePath, imgName);
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + menuPath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			menu.setMenuImg(menuPath);
		}
		int result = service.updateMenu(menu);
		if(result > 0) {
			request.setAttribute("msg", "변경이 완료되었습니다.");
			request.setAttribute("url", "/menuFrm.do");
			return "common/alert";
		} else {
			request.setAttribute("msg", "변경 중 문제가 발생했습니다.");
			request.setAttribute("url", "/menuFrm.do");
			return "common/alert";
		}
	}

	@RequestMapping(value = "/updateStoreFrm.do")
	public String updateStoreFrm(HttpSession session, Model model) {
		Owner o = (Owner) session.getAttribute("o");
		ArrayList<Store> s = service.selectStore(o);
		model.addAttribute("s", (ArrayList<Store>) s);
		return "/store/updateStoreFrm";
	}

	@RequestMapping(value = "/selectTag.do")
	public String selectTag(String category, int reqPage, Model model) {
		HashMap<String, Object> map = service.selectTag(category, reqPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("category", category);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));

		return "store/storeListFrm";
	}
	
	@RequestMapping(value = "/searchStoreList.do")
	public String searchStoreList(String search, int reqPage, Model model,@RequestParam String category) {
		System.out.println(category);
		HashMap<String, Object> map = service.searchStoreList(search, reqPage, category);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("category", category);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));

		return "store/storeListFrm";
	}
	
	@RequestMapping(value = "/sortStoreList.do")
	public String sortStoreList(String storeListSort, int reqPage, Model model,@RequestParam String category) {
		System.out.println(storeListSort);
		HashMap<String, Object> map = service.sortStoreList(storeListSort, reqPage, category);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("category", category);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		
		return "store/storeListFrm";
	}
}