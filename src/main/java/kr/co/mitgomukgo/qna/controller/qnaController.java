package kr.co.mitgomukgo.qna.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileRename;
import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.qna.model.service.qnaService;
import kr.co.mitgomukgo.qna.model.vo.Qna;
import kr.co.mitgomukgo.qna.model.vo.QnaFile;

@Controller
public class qnaController {
	@Autowired
	private qnaService service;
	
	@Autowired
	private FileRename fileRename;
	
	@RequestMapping(value="/qnalist.do")
	public String selectAllQna(int reqPage, Model model) {
		HashMap<String, Object> map = service.selectAllQna(reqPage);
		
		if(map == null) {
			model.addAttribute("msg", "아직 QnA가 없습니다.");
			return "qna/qnaList";
		}else {
			model.addAttribute("list", map.get("list"));
			model.addAttribute("pageNavi", map.get("pageNavi"));
			return "qna/qnaList";
		}
	}
	
	@RequestMapping(value="/insertQnaFrm.do")
	public String insertQnaFrm() {
		return "qna/qnaWrite";
	}
	
	@RequestMapping(value="/insertQna.do")
	public String insertQna(Qna q, MultipartFile[] qnaFile, HttpServletRequest request) {
		
		ArrayList<QnaFile> list = new ArrayList<QnaFile>();
		
		if(!qnaFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/qna/");
			
			for(MultipartFile files : qnaFile) {
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
				
				QnaFile qf = new QnaFile();
				qf.setFilename(filename);
				qf.setFilepath(filepath);
				list.add(qf);
			}
		}
		q.setFileList(list);
		int result = service.insertQna(q);
		
		return "redirect:/qnalist.do?reqPage=1";
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadImgQna.do", produces = "application/json;charset=utf-8")
	public String uploadImgQna(MultipartFile[] upfile, HttpServletRequest request) {
		QnaFile qf = null;
		
		if(!upfile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/qna/editor/");
			
			for(MultipartFile files : upfile) {
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
				qf = new QnaFile();
				qf.setFilename(filename);
				qf.setFilepath(filepath);
			}
		}
		
		Gson gson = new Gson();
		String result = gson.toJson("/resources/upload/qna/editor/" + qf.getFilepath());
		
		return result;
	}
	
	@RequestMapping(value="/qndDetail.do")
	public String qnaDetail(int qnaNo, Model model) {
		Qna qna = service.qnaDetail(qnaNo);
		model.addAttribute("qna", qna);
		System.out.println(qna.getFileList());
		return "qna/qnaDetail";
	}
	
	@RequestMapping(value="/mypageQna.do")
	public String mypage(int qnaNo, String qnaPassword, Model model) {
		Qna qnaPw = service.selectQnaPassword(qnaNo, qnaPassword);
		
		if(qnaPw != null) {
			model.addAttribute("qna", qnaPw);
			System.out.println(qnaPw.getFileList());
			return "redirect:/qndDetail.do?qnaNo=" + qnaNo;
		}else {
			return "redirect:/qnalist.do?reqPage=1";
		}
			
	}
	
	@RequestMapping(value="/qnaFileDown.do")
	public void qnaFileDown(int qnaFileNo, HttpServletRequest request, HttpServletResponse respone) {
		
		// 파일번호로 파일하나 가져오기
		QnaFile qf = service.selectOneQnaFile(qnaFileNo);
		
		// 다운로드되는 파일 경로
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/qna/" + qf.getFilepath());
		
		// 파일 다운로드 로직
		try {
			
			FileInputStream fis = new FileInputStream(savePath);
			BufferedInputStream bis = new BufferedInputStream(fis);
			
			//
			ServletOutputStream sos = respone.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(sos);
			
			// 크롬에서 파일 다운로드
			String downName = new String(qf.getFilename().getBytes("utf-8"), "ISO-8859-1");
			
			respone.setContentType("application/octet-stream");
			respone.setHeader("Content-Disposition", "attachment;filename=" + downName);
			
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
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/updateQnaFrm.do")
	public String updateQnaFrm(int qnaNo, Model model) {
		Qna qna = service.qnaDetail(qnaNo);
		model.addAttribute(qna);
		System.out.println(qna.getFileList());
		return "qna/updateQnaFrm";
	}
	
	@RequestMapping("/updateQna.do")
	public String updateQna(int[] fileNoList, String[] filepathList, Qna qna,MultipartFile[] qnaFile, HttpServletRequest request) {
		ArrayList<QnaFile> list = new ArrayList<QnaFile>();
		QnaFile qf = null;
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/qna/");
		if(!qnaFile[0].isEmpty()) {
			
			
			
			for(MultipartFile files : qnaFile) {
				String filename = files.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath, filename);
				
				try {
					FileOutputStream fos = new FileOutputStream(savePath + filepath);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = files.getBytes();
					
					bos.write(bytes);
					bos.close();
					
					qf = new QnaFile();
					qf.setFilename(filename);
					qf.setFilepath(filepath);
					list.add(qf);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
		}
		
		qna.setFileList(list);
		
		int result = service.updateQna(qna, fileNoList);
		if(fileNoList != null && (result == (list.size() + fileNoList.length + 1))) {
			if(filepathList != null) {
				for(String filepath : filepathList) {
					File delFile = new File(savePath + filepath);
					delFile.delete();
				}
			}
		}
		
		return "redirect:/qnalist.do?reqPage=1";
	}
	
	@RequestMapping(value="/deleteQna.do")
	public String deleteQna(int qnaNo, HttpServletRequest request) {
		ArrayList<QnaFile> list = service.deleteQna(qnaNo);
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/qna/");
		
		if(list != null) {
			for(QnaFile qf : list) {
				File delFile = new File(savePath + qf.getFilepath());
				delFile.delete();
			}
		}
		
		System.out.println(qnaNo);
		
		return "redirect:/qnalist.do?reqPage=1";
		
	}
	
	@RequestMapping(value="/insertComment.do")
	public String insertComment(Qna qna) {
		int result  = service.insertComment(qna);
		
		return "redirect:/qndDetail.do?qnaNo=" + qna.getQnaNo();
	}
	
	@RequestMapping(value="/updateComment.do")
	public String updateComment(Qna qna) {
		int result = service.updateComment(qna);
		
		return "redirect:/qndDetail.do?qnaNo=" + qna.getQnaNo();
	}
	
	@RequestMapping(value="/deleteComment.do")
	public String deleteComment(int qnaNo) {
		int result = service.deleteComment(qnaNo);
		
		return "redirect:/qndDetail.do?qnaNo=" + qnaNo;
	}
	
	@RequestMapping(value = "/searchQna.do")
	public String searchQna(int reqPage, String type, String keyword, Model model) {
		HashMap<String, Object> map = service.searchQna(reqPage, type, keyword);
		
		if(map == null) {
			model.addAttribute("msg", "'" + keyword + "'와(과) 일치하는 결과가 없습니다.");
			return "qna/qnaList";
		}else {
			model.addAttribute("list", map.get("list"));
			model.addAttribute("pageNavi", map.get("pageNavi"));
			model.addAttribute("keyword", keyword);
			return "qna/qnaList";
		}
	}
	
	@RequestMapping(value="/selectThemeqna.do")
	public String selectThemeQna(String qnaTheme, int reqPage, Model model) {
		HashMap<String, Object> map = service.selectThemeQna(qnaTheme, reqPage);
		
		if(map == null) {
			model.addAttribute("msg", "'" + qnaTheme + "'과 관련된 QnA가 없습니다.");
			return "qna/qnaList";
		}else {
			model.addAttribute("list", map.get("list"));
			model.addAttribute("pageNavi", map.get("pageNavi"));
			model.addAttribute("theme", qnaTheme);
			return "qna/qnaList";
		}
	}
	
	@RequestMapping(value="/selectService.do")
	public String selectService() {
		return "qna/select";
	}
	
	@RequestMapping(value="/selectMyQnaList.do")
	public String selectMyQnaList(int reqPage, String qnaWriter1, Model model) {
		HashMap<String, Object> map = service.selectMyQnaList(reqPage, qnaWriter1);
		
		if(map == null) {
			model.addAttribute("msg", "아직 QNA가 없습니다.");
			return "qna/qnaList";
		}else {
			model.addAttribute("list", map.get("list"));
			model.addAttribute("pageNavi", map.get("pageNavi"));
			return "qna/qnaList";
		}
	}
	
}




















