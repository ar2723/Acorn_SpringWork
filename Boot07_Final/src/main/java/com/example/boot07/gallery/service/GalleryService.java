package com.example.boot07.gallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import com.example.boot07.gallery.dto.GalleryDto;

public interface GalleryService {
	//갤러리의 리스트 얻어오기
	public void getList(HttpServletRequest request);
	//갤러리에 사진 upload & DB 저장하기
	public void saveImage(GalleryDto dto, HttpServletRequest request);
	//갤러리 detail 페이지에 필요한 data를 ModelAndView 에 저장
	public void getData(int num, Model model);
}
