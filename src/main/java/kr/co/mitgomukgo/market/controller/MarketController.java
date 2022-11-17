package kr.co.mitgomukgo.market.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileRename;
import kr.co.mitgomukgo.market.model.service.MarketService;
import kr.co.mitgomukgo.market.model.vo.Market;
import kr.co.mitgomukgo.notice.model.vo.Notice;
import kr.co.mitgomukgo.store.model.vo.Menu;
import kr.co.mitgomukgo.store.model.vo.Review;
import kr.co.mitgomukgo.store.model.vo.Store;

@Controller
public class MarketController {

	@Autowired
	private MarketService service;

	@Autowired
	private FileRename fileRename;

	public MarketController() {
		super();
	}

	@RequestMapping(value = "/marketMain.do")
	public String marketMainFrm(int reqPage, int pCategory, Model model) {
		HashMap<String, Object> map = service.marketList(reqPage, pCategory);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pCategory", pCategory);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		
		return "market/marketMain";
	}

	// 마켓 상세 이동
	@RequestMapping(value = "/marketDetailView.do")
	public String marketDetailView() {
		return "market/marketDetail";
	}
	
	// 마켓 상세 보기
	@RequestMapping(value = "/marketDetail.do")
	public String marketDetail(int pNo, String bookMarkId, Model model) {
		HashMap<String, Object> map = service.selectOneMarket(pNo, bookMarkId); // 해쉬맵으로 담아서 한꺼번에 가져오기
		model.addAttribute("ma", map.get("ma"));
		model.addAttribute("bm", map.get("bm"));
		return "market/marketDetail";
	}
	
	//주문 관리 이동
	/*
	@RequestMapping(value = "/ownerOrderManageFrm.do")
	public String ownerOrderManageFrm(int reqPage) {
		return "member/ownerOrderManageFrm";
	}
	*/
	
	

	@RequestMapping(value = "/addMarketProductFrm.do")
	public String addMarketProductFrm(Model model) {
		ArrayList<Notice> ncList = service.myPageNcList();
		model.addAttribute("ncList", ncList);
		return "market/addMarketProductFrm";
	}

	@ResponseBody
	@RequestMapping(value = "/marketEditorUpload.do", produces = "application/json;charset=utf-8")
	public String noticeEditorUpload(MultipartFile[] files, HttpServletRequest request) {
		String filepath = null;
		// 파일이 비어있지 않다면
		if (!files[0].isEmpty()) {
			// 파일 경로 설정
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/market/editor/");
			// 파일 중복처리
			for (MultipartFile fileList : files) {
				String filename = fileList.getOriginalFilename();
				filepath = fileRename.fileRename(savePath, filename);
				try {
					FileOutputStream fos = new FileOutputStream(savePath + filepath);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = fileList.getBytes();

					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		Gson gson = new Gson();
		String result = gson.toJson("/resources/upload/market/editor/" + filepath);
		return result;
	}

	@RequestMapping(value = "/addMarketProduct.do")
	public String addMarketProduct(Market market, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/market/");
			String imgName = file.getOriginalFilename();
			String maProductPath = fileRename.fileRename(savePath, imgName);
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + maProductPath));
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
			market.setPImg(maProductPath);
		}
		int result = service.addMarketProduct(market);
		return "redirect:/marketProductListFrm.do";
	}

	@RequestMapping(value = "/marketProductListFrm.do")
	public String marketProductListFrm(Model model, @SessionAttribute Store s) {
		ArrayList<Notice> ncList = service.myPageNcList();
		model.addAttribute("ncList", ncList);
		ArrayList<Market> list = service.marketProductList(s.getStoreNo());
		model.addAttribute("list", list);
		return "market/marketProductList";
	}

	@RequestMapping(value = "/deleteMarketProduct.do")
	public String deleteMarketProduct(int pNo, HttpServletRequest request) {
		int result = service.deleteMarketProduct(pNo);
		if (result > 0) {
			return "redirect:/marketProductListFrm.do";
		} else {
			request.setAttribute("msg", "삭제시 문제가 발생했습니다.");
			request.setAttribute("url", "/marketProductListFrm.do");
			return "common/alert";
		}
	}

	@RequestMapping(value = "/updateMarketProductFrm.do")
	public String updateMarketProductFrm(int pNo, Model model) {
		Market ma = service.readOneMarketProduct(pNo);
		model.addAttribute("ma", ma);
		return "market/updateMarketProductFrm";
	}
	
	@RequestMapping(value = "/updateMarketProduct.do")
	public String updateMarketProduct(Market market, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/market/");
			String imgName = file.getOriginalFilename();
			String maProductPath = fileRename.fileRename(savePath, imgName);
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + maProductPath));
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
			market.setPImg(maProductPath);
		}
		int result = service.updateMarketProduct(market);
		if (result > 0) {
			request.setAttribute("msg", "수정이 완료되었습니다.");
			request.setAttribute("url", "/marketProductListFrm.do");
			return "common/alert";
		} else {
			request.setAttribute("msg", "변경 중 문제가 발생했습니다.");
			request.setAttribute("url", "/marketProductListFrm.do");
			return "common/alert";
		}
	}

	@RequestMapping(value="/searchMarket.do")
	public String searchMarket(int reqPage ,String search ,String type ,String pCategory ,Model model ,HttpServletRequest request) {
		HashMap<String, Object> map = service.searchMarket(reqPage,search,type,pCategory);
		//System.out.println("list :" + map.get("list"));
		if(map.get("list") != null) {
			model.addAttribute("list",map.get("list"));
			model.addAttribute("reqPage",reqPage);
			model.addAttribute("pCategory",pCategory);
			model.addAttribute("pageNavi", map.get("pageNavi"));
			model.addAttribute("total", map.get("total"));
			model.addAttribute("pageNo", map.get("pageNo"));
			model.addAttribute("search", search);
			model.addAttribute("type", type);
			return "market/marketMain";
		} else{
			request.setAttribute("msg", "검색 결과가 존재하지 않습니다.");
			request.setAttribute("url", "/marketMain.do?reqPage=1&pCategory="+pCategory);
			return "common/alert";
		}
		
	}
}

