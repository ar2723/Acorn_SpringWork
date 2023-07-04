package com.gura.spring04.gallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.gura.spring04.gallery.dto.GalleryDto;

public interface GalleryService {
	//갤러리의 리스트 얻어오기
	public void getList(HttpServletRequest request);
	//갤러리에 사진 upload & DB 저장하기
	public void saveImage(GalleryDto dto, HttpServletRequest request);
	//갤러리 detail 페이지에 필요한 data를 ModelAndView 에 저장
	public void getData(int num, ModelAndView mView);
}
