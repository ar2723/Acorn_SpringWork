package com.example.boot07.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.boot07.file.dto.FileDto;
import com.example.boot07.file.service.FileService;

@Controller
public class FileController {
	
	@Autowired
	private FileService service;
	
	@Value("${file.location}")
	private String fileLocation;
	
	@GetMapping("/file/list")
	//여기서 전달된 request 객체는 list.jsp에서 폼으로 전달된 데이터를 매개변수로 받아서 전달하는 역할을 한다.
	public String list(HttpServletRequest request) {
		service.getList(request);
		return "file/list";
	}
	   
   @GetMapping("/file/upload_form")
   public String uploadForm() {
      return "file/upload_form";
   }
   
   @RequestMapping("/file/upload")
   public String upload(FileDto dto, Model model, HttpServletRequest request) {
      //FileDto에는 폼전송되는 title과 myFile이 들어 있다.
	  service.saveFile(dto, model, request);
      return"file/upload";
   }
   
   @GetMapping("/file/download")
   public ResponseEntity<InputStreamResource> download(int num) throws UnsupportedEncodingException, FileNotFoundException {
	  //num은 다운로드 해줄 파일의 번호 (PK)
      FileDto dto = service.getFileData(num);
      
      String orgFileName = dto.getOrgFileName();
      long fileSize = dto.getFileSize();
      String saveFileName = dto.getSaveFileName();
      
      //다운로드 시켜줄 원본 파일명
      String encodedName = URLEncoder.encode(orgFileName, "utf-8");
		
      encodedName = encodedName.replaceAll("\\+"," ");
      HttpHeaders headers = new HttpHeaders();
      headers.add(HttpHeaders.CONTENT_TYPE, "application/octet-stream");
      // 파일의 이름 정보(웹브라우저가 해당 정보를 이용해서 파일을 만들어 준다)
      headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename="+encodedName);
      // 파일의 크기 정보도 담아준다.
      headers.setContentLength(fileSize);
		  
      // 읽어들일 파일의 경로 구성
      String filePath=fileLocation + File.separator + saveFileName;
      // 파일에서 읽어들일 스트림 객체
      InputStream is=new FileInputStream(filePath);
      // InputStreamResource 객체의 참조값 얻어내기
      InputStreamResource isr = new InputStreamResource(is);
      // ResponseEntity 객체의 참조값 얻어내기
      ResponseEntity<InputStreamResource> resEn = ResponseEntity.ok()
    		  .headers(headers)
    		  .header("Content-Transfer-Encoding", "binary")
    		  .body(isr);
      return resEn;
   }
   
   @RequestMapping("/file/delete")
   public String delete(int num, HttpServletRequest request) {
      service.deleteFile(num, request);
      return "redirect:/file/list";
   }
}
