package kr.co.mitgomukgo.faq.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.faq.model.service.faqService;
import kr.co.mitgomukgo.faq.model.vo.Faq;

@Controller
public class faqController {
	
	@Autowired
	private faqService service;
	
	@RequestMapping(value="/selectAllFaq.do")
	public String selectAllFaq(int reqPage, Model model) {
		HashMap<String, Object> map = service.selectAllFaq(reqPage);
		
		if(map == null) {
			model.addAttribute("msg", "아직 등록된 faq가 없습니다.");
			return "faq/faqList";
		}else {
			model.addAttribute("list", map.get("list"));
			model.addAttribute("reqPage", reqPage);
			model.addAttribute("pageNavi", map.get("pageNavi"));
			model.addAttribute("total", map.get("total"));
			model.addAttribute("pageNo", map.get("pageNo"));
			return "faq/faqList";
		}
	}
	
	@RequestMapping(value="/goFaqFrm.do")
	public String goInsertFaq() {
		return "faq/faqWriteFrm";
	}
	
	@RequestMapping(value="/insertFaq.do")
	public String insertFaq(Faq faq, Model model) {
		int result = service.insertFaq(faq);
		return "redirect:/selectAllFaq.do?reqPage=" + 1;
	}
	
	@RequestMapping(value="/deleteFaq.do")
	public String deleteFaq(int faqNo) {
		int result = service.deleteFaq(faqNo);
		return "redirect:/selectAllFaq.do?reqPage=" + 1;
	}
	
	@RequestMapping(value="/updateFaqFrm.do")
	public String updateFaqFrm(int faqNo, Model model) {
		Faq faq = service.selectOneFaq(faqNo);
		model.addAttribute("faq", faq);
		return "faq/updateFaqFrm";
	}
	
	@RequestMapping(value="/updateFaq.do")
	public String updateFaq(Faq faq, Model model) {
		int result = service.updateFaq(faq);
		return "redirect:/selectAllFaq.do?reqPage=" + 1;
	}
	
	@RequestMapping(value="/selectThemeFaq.do")
	public String selectThemeFaq(String faqTheme, int reqPage, Model model) {
		HashMap<String, Object> map = service.selectThemeFaq(faqTheme, reqPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", map.get("reqPage"));
		model.addAttribute("theme", faqTheme);
		
		return "faq/faqList";
	}
	
	@RequestMapping(value="/selectSearchFaq.do")
	public String selectSearchFaq(String type, String keyword, Model model) {
		ArrayList<Faq> list = service.selectSearchFaq(type, keyword);
		
		if(list == null) {
			model.addAttribute("msg", "아직 등록된 faq가 없습니다.");
			return "faq/faqList";
		}else {
			model.addAttribute("list", list);
			return "faq/faqList";
		}
	}
}






















