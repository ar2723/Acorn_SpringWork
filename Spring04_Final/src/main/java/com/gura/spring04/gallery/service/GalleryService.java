package com.gura.spring04.gallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.gura.spring04.gallery.dto.GalleryDto;

public interface GalleryService {
	//이미지 리스트 얻어오기
	public void getList(HttpServletRequest request);
	//업로드 된 이미지 저장하기
	public void saveImage(GalleryDto dto, HttpServletRequest request);
	//이미지 하나의 정보 얻어오기
	public void getData(int num, ModelAndView mView);
}
