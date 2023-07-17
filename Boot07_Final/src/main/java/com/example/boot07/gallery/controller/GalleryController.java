package com.example.boot07.gallery.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.boot07.gallery.dto.GalleryDto;
import com.example.boot07.gallery.service.GalleryService;

@Controller
public class GalleryController {
	
	@Value("${file.location}")
	public String fileLocation;
	
	@Autowired
	private GalleryService service;
	
	@GetMapping("/gallery/list")
	public String list (HttpServletRequest request) {
		service.getList(request);
		return "gallery/list";
	}
	
	//gallery 사진 업로드 form 페이지로 이동
	@GetMapping("/gallery/upload_form")
	public String uploadForm() {
		return "/gallery/upload_form";
	}
	
	//gallery 사진 업로드 & DB 저장
	@PostMapping("/gallery/upload")
	public String upload(GalleryDto dto, HttpServletRequest request) {
		//form 에서 dto로 데이터 받아옴
		//dto : caption, MultipartFile myFile을 가지고 있다.
		//request :  imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		service.saveImage(dto, request);
		return "gallery/upload";
	}
	
	//gallery 게시글의 num 이 parameter get 방식으로 넘어온다.
	//detail 페이지
	@GetMapping("/gallery/detail")
	public String detail(int num, Model model) {
		//갤러리 detail 페이지에 필요한 data를 num으로 가져와, ModelAndView에 저장
		service.getData(num, model);
		return "gallery/detail";
	}
	
	//gallery 사진 업로드 form 페이지로 이동
	@GetMapping("/gallery/upload_form2")
	public String uploadForm2() {
		return "gallery/upload_form2";
	}
	
	@GetMapping("/gallery/upload_form3")
	public String uploadForm3() {
		return "gallery/upload_form3";
	}
	
	@ResponseBody
	@PostMapping("/gallery/ajax_upload")
	public Map<String, Object> ajaxUpload(GalleryDto dto, HttpServletRequest request) {
		//서비스를 이용해서 업로드 된 이미지를 저장하고
		service.saveImage(dto, request);
		// {"isSuccess", true} 형식의 json 문자열 응답
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	
	@GetMapping(
			value = "/gallery/images/{imageName}",
			produces = {MediaType.IMAGE_GIF_VALUE,  MediaType.IMAGE_PNG_VALUE, 
					MediaType.IMAGE_JPEG_VALUE}
	)
	@ResponseBody
	public byte[] galleryImage(@PathVariable("imageName") String imageName) throws IOException {
		String absolutePath = fileLocation + File.separator + imageName;
		// 파일에서 읽어들일 InputStream
		InputStream is = new FileInputStream(absolutePath);
		// 이미지 데이터 (byte)를 읽어서 배열에 담아서 클라이언트에게 응답한다.
		return IOUtils.toByteArray(is);
	}	
}
