package com.gura.spring04.gallery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring04.gallery.dto.GalleryDto;
import com.gura.spring04.gallery.service.GalleryService;

@Controller
public class GalleryController {
	
	@Autowired
	private GalleryService service;
	
	@RequestMapping("/gallery/list")
	public String list (HttpServletRequest request) {
		service.getList(request);
		return "gallery/list";
	}
	@RequestMapping("/gallery/upload_form")
	public String uploadForm() {
		return "/gallery/upload_form";
	}
	@RequestMapping("/gallery/upload")
	public String upload(GalleryDto dto, HttpServletRequest request) {
		service.saveImage(dto, request);
		return "redirect:/gallery/list";
	}
	@RequestMapping("/gallery/detail")
	public ModelAndView detail(int num, ModelAndView mView) {
		service.getData(num, mView);
		mView.setViewName("gallery/detail");
		return mView;
	}
}
