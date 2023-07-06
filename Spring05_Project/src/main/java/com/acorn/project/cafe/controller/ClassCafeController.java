package com.acorn.project.cafe.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.cafe.dto.CafeCommentDto;
import com.acorn.project.cafe.dto.ClassCafeDto;
import com.acorn.project.cafe.service.ClassCafeService;

@Controller
public class ClassCafeController {
	@Autowired
	private ClassCafeService service;
	
	@RequestMapping("/cafe/classCafeList")
	public ModelAndView getList(ModelAndView mView, HttpServletRequest request) {
		//서비스에 HttpServletRequest 객체를 전달해서 응답에 필요한 데이터가 담기도록 하고
		service.getList(request);
		//view page로 forward 이동해서 응답하기
		mView.setViewName("cafe/classCafeList");
		return mView;
	}
	
	@RequestMapping("/cafe/classCafeInsertform")
	public String classCafeInsertform() {
		return "cafe/classCafeInsertform";
	}
	
	@RequestMapping("/cafe/classCafeInsert")
	public String classCafeInsert(ClassCafeDto dto, HttpServletRequest request) {
		String writer=(String)request.getSession().getAttribute("id");
		dto.setWriter(writer);
		service.saveContent(dto);
		return "redirect:/cafe/classCafeList";
	}
	
	@RequestMapping("/cafe/classCafeDetail")
	public String classCafeDetail(HttpServletRequest request) {
		service.getDetail(request);
		return "cafe/classCafeDetail";
	}
	
	@RequestMapping("/cafe/classCafeDetailAddedLike")
	public String classCafeDetailAddedLike(HttpServletRequest request) {
		service.getDetailAddedLike(request);
		return "cafe/classCafeDetail";
	}
	
	@RequestMapping("/cafe/classCafeUpdateform")
	public String classCafeUpdateform(HttpServletRequest request) {
		service.getData(request);
		return "cafe/classCafeUpdateform";
	}
	
	@RequestMapping("/cafe/classCafeUpdate")
	public String classCafeUpdate(ClassCafeDto dto) {
		service.updateContent(dto);
		return "redirect:/cafe/classCafeList";
	}
	
	@RequestMapping("/cafe/classCafeDelete")
	public String classCafeDelete(int num, HttpServletRequest request) {
		service.deleteContent(num, request);
		return "redirect:/cafe/classCafeList";
	}
	
	@RequestMapping("/cafe/classCafeAddLike")
	public String classCafeAddLike(int num, HttpServletRequest request) {
		service.addLikeCount(request);
		return "redirect:/cafe/classCafeDetailAddedLike?num="+ num;
	}
}
