package com.gura.spring04.file.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring04.file.dto.FileDto;
import com.gura.spring04.file.service.FileService;

@Controller
public class FileController {
	
	@Autowired
	private FileService service;
	
	@RequestMapping("/file/list")
	//여기서 전달된 request 객체는 list.jsp에서 폼으로 전달된 데이터를 매개변수로 받아서 전달하는 역할을 한다.
	public String list(HttpServletRequest request) {
		service.getList(request);
		return "file/list";
	}
	   
	   @RequestMapping("/file/upload_form")
	   public String uploadForm() {
	      return "file/upload_form";
	   }
	   
	   @RequestMapping("/file/upload")
	   //여기서 폼을 통해 제출한 파일의 객체의 참조값이 dto에 자동으로 담기게 되고, 이는 service.savaFile 처리에서
	   //MultipartFile 타입 변수로 받아서 해당 파일 객체의 정보를 추출하게 된다.
	   //여기서 request 객체는 폼으로 전달되는 매개변수를 추출하기 위한 것이 아닌, service에서 처리에서 파일 경로 설정을 위해
	   //미리 생성해서 전달해주는 것이다.
	   public ModelAndView upload(FileDto dto, ModelAndView mView, HttpServletRequest request) {
	      //FileDto에는 폼전송되는 title과 myFile이 들어 있다.
		  service.saveFile(dto, mView, request);
	      mView.setViewName("file/upload");
	      return mView;
	   }
	   
	   @RequestMapping("/file/download")
	   public ModelAndView download(int num, ModelAndView mView) {
		  //num은 다운로드 해줄 파일의 번호 (PK)
	      service.getFileData(num, mView);
	      // 응답을 할 bean 의 이름을 설정 
	      mView.setViewName("fileDownView");
	      return mView;
	   }
	   
	   @RequestMapping("/file/delete")
	   //여기서 mView 객체는 리다이렉트 응답 경로를 설정해주기 위해 매개변수에서 선언한 것이다.
	   //여기서 request 객체는 로그인 정보 검증 및 service에서 파일 삭제 처리 과정 중 파일 경로 설정을 위해 전달된 것이다.
	   public ModelAndView delete(int num, ModelAndView mView, HttpServletRequest request) {
	      service.deleteFile(num, request);
	      mView.setViewName("redirect:/file/list");
	      return mView;
	   }
}
