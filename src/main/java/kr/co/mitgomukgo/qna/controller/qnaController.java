package kr.co.mitgomukgo.qna.controller;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileRename;
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
	
	
	
}




















