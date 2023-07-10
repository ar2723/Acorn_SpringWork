package com.acorn.project.home.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.acorn.project.cafe.dto.CafeDto;
import com.acorn.project.cafe.dto.ClassCafeDto;
import com.acorn.project.gallery.dto.GalleryDto;

public interface HomeService {
	public List<CafeDto> getCafeList(HttpServletRequest request);
	public List<ClassCafeDto> getClassCafeList(HttpServletRequest request);
	public List<GalleryDto> getGalleryList(HttpServletRequest request);
}
