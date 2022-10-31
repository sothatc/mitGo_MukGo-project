package kr.co.mitgomukgo.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.notice.model.service.NoticeService;
import kr.co.mitgomukgo.notice.model.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping(value="/selectNoticeList.do")
	public String selectAllNotice(int reqPage, Model model) {
		HashMap<String, Object> list = service.selectAllNotice(reqPage);
		
		if(list == null) {
			model.addAttribute("msg", "아직 공지사항이 없습니다.");
			return "notice/noticeList";
		}else {
			model.addAttribute("list", list.get("list"));
			return "notice/noticeList";
		}
	}
	
	@RequestMapping(value="/goNoticeFrm.do")
	public String goNoticeFrm() {
		return "notice/noticeWriteFrm";
	}
}
