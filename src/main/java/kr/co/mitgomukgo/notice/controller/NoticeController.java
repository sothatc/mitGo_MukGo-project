package kr.co.mitgomukgo.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileRename;
import kr.co.mitgomukgo.notice.model.service.NoticeService;
import kr.co.mitgomukgo.notice.model.vo.Notice;
import kr.co.mitgomukgo.notice.model.vo.NoticeFile;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private FileRename fileRename;
	
	@RequestMapping(value="/selectNoticeList.do")
	public String selectAllNotice(int reqPage, Model model) {
		HashMap<String, Object> list = service.selectAllNotice(reqPage);
		
		if(list == null) {
			model.addAttribute("msg", "아직 공지사항이 없습니다.");
			return "notice/noticeList";
		}else {
			model.addAttribute("list", list.get("list"));
			model.addAttribute("pageNavi", list.get("pageNavi"));
			return "notice/noticeList";
		}
	}
	
	@RequestMapping(value="/goNoticeFrm.do")
	public String goNoticeFrm() {
		return "notice/noticeWriteFrm";
	}
	
	@RequestMapping(value="/insertNoticeWrite.do")
	public String insertNotice(Notice notice, MultipartFile[] noticeFile, HttpServletRequest request) {
		// 파일을 담아둘 리스트생성
		ArrayList<NoticeFile> fileList = new ArrayList<NoticeFile>();
		
		// noticeFile배열이 비어있지 않다면
		if(!noticeFile[0].isEmpty()) {
			
			// 파일 경로 설정
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			
			// 반복문으로 파일업로드
			for(MultipartFile files : noticeFile) {
				// 파일 중복체크
				String filename = files.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath, filename);
				
				try {
					FileOutputStream fos = new FileOutputStream(savePath + filepath);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = files.getBytes();
					
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				NoticeFile nf = new NoticeFile();
				nf.setFilename(filename);
				nf.setFilepath(filepath);
				fileList.add(nf);
				
			}
		}
		
		int result = service.insertNotice(notice, fileList);
		
		return "redirect:/selectNoticeList.do?reqPage=1";
	}
	
	@ResponseBody
	@RequestMapping(value="/noticeEditorUpload.do", produces = "application/json;charset=utf-8")
	public String noticeEditorUpload(MultipartFile[] files, HttpServletRequest request) {
		NoticeFile nf = null;
		
		// 파일이 비어있지 않다면
		if(!files[0].isEmpty()) {
			// 파일 경로 설정
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/editor/");
			// 파일 중복처리
			for(MultipartFile fileList : files) {
				String filename = fileList.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath, filename);
				
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
				
				nf = new NoticeFile();
				nf.setFilename(filename);
				nf.setFilepath(filepath);
			}
			
		}
		
		Gson gson = new Gson();
		String result = gson.toJson("/resources/upload/notice/editor/" + nf.getFilepath());
		return result;
	}
	
	@RequestMapping(value="/noticeDetail.do")
	public String noticeDetail(int noticeNo, Model model) {
		Notice notice = service.selectOneNotice(noticeNo);
		
		if(notice == null) {
			model.addAttribute("msg", "없는데?");
			return "notice/noticeDetail";
		}else {
			
			model.addAttribute("n", notice);
			return "notice/noticeDetail";
			
		}
		
	}
	
	@RequestMapping(value = "/noticeFileDown.do")
	public void noticeFileDown(int noticeFileNo, Model model, HttpServletRequest request, HttpServletResponse respone) {
		NoticeFile notice = service.selectOneNoticeFile(noticeFileNo);
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		String filepath = savePath + notice.getFilepath();
		
		try {
			FileInputStream fis = new FileInputStream(filepath);
			BufferedInputStream bis = new BufferedInputStream(fis);
			
			ServletOutputStream sos = respone.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(sos);
			
			String resFilename = new String(notice.getFilename().getBytes("UTF-8"), "ISO-8859-1");
			
			respone.setContentType("application/octet-stream");
			respone.setHeader("Content-Disposition", "attachment;filename=" + resFilename);
			
			while(true) {
				int read = bis.read();
				if(read != -1) {
					bos.write(read);
				}else {
					break;
				}
			}
			bis.close();
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value="updateNoticeFrm.do")
	public String updateNoticeFrm(int noticeNo, Model model) {
		Notice notice = service.selectOneNotice(noticeNo);
		model.addAttribute("n", notice);
		
		return "notice/updateNoticeFrm";
	}
	
	@RequestMapping("updateNotice.do")
	public String updateNotice(int[] fileNoList, String[] filePathList, Notice n, MultipartFile[] noticeFile, HttpServletRequest request) {
		ArrayList<NoticeFile> list = new ArrayList<NoticeFile>();
		
		if(!noticeFile[0].isEmpty()) {
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			
			for(MultipartFile files : noticeFile) {
				String filename = files.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath, filename);
				
				try {
					FileOutputStream fos = new FileOutputStream(savePath + filepath);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = files.getBytes();
					
					bos.write(bytes);
					bos.close();
					
					NoticeFile nf = new NoticeFile();
					nf.setFilename(filename);
					nf.setFilepath(filepath);
					list.add(nf);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		n.setFileList(list);
		int result = service.updateNotice(n, fileNoList);
		
		if(fileNoList != null && result == (list.size() + fileNoList.length + 1)) {
			if(filePathList != null) {
				for(String path : filePathList) {
					File delFile = new File("/resources/upload/notice/" + path);
					delFile.delete();
				}
			}
		}
		return "redirect:/noticeDetail.do?noticeNo=" + n.getNoticeNo();
	}
	
	@RequestMapping(value="/deleteNotice.do")
	public String deleteNotice(int noticeNo, HttpServletRequest request) {
		
		ArrayList<NoticeFile> list = service.selectNoticeFile(noticeNo);
		
		if(list != null) {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			for(NoticeFile nf : list) {
				File delFile = new File(path + nf.getFilepath());
				delFile.delete();
			}
		}
		return "redirect:/selectNoticeList.do?reqPage=1";
	}
	
	@RequestMapping(value="/searchNotice.do")
	public String searchNotice(String type, String keyword, int reqPage, Model model) {
		
		HashMap<String, Object> list = service.selectSearchNotice(type, keyword, reqPage);
		
		if(list == null) {
			model.addAttribute("msg", "검색어와 일치하는 내용이 없습니다.");
			return "notice/noticeList";
		}else {
			model.addAttribute("list", list.get("list"));
			model.addAttribute("pageNavi", list.get("pageNavi"));
			return "notice/noticeList";
		}
		
	}

}






















