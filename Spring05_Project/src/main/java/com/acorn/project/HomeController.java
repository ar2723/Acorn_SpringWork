package com.acorn.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.cafe.dto.CafeDto;
import com.acorn.project.cafe.dto.ClassCafeDto;
import com.acorn.project.gallery.dto.GalleryDto;
import com.acorn.project.home.service.HomeService;


@Controller
public class HomeController {
	
	@Autowired
	private HomeService service;
	
	@RequestMapping(value = "/")
	public ModelAndView home(HttpServletRequest request, ModelAndView mView) {
		List<CafeDto> cafeList = service.getCafeList(request);
		List<ClassCafeDto> classCafeList = service.getClassCafeList(request);
		List<GalleryDto> galleryList = service.getGalleryList(request);
		mView.addObject("cafeList", cafeList);
		mView.addObject("classCafeList", classCafeList);
		mView.addObject("galleryList", galleryList);
		mView.setViewName("home");
		return mView;
	}
}
