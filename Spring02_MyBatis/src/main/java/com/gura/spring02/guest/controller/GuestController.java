package com.gura.spring02.guest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring02.guest.dao.GuestDao;
import com.gura.spring02.guest.dto.GuestDto;

@Controller
public class GuestController {
	@Autowired
	private GuestDao dao;
	
	@RequestMapping("/guest/delete")
	public String delete(int num) {
		dao.delete(num);
		return "redirect:/guest/list";
	}
	
	@RequestMapping("/guest/deleteform")
	public String deleteform() {
		return "guest/deleteform";
	}
	
	@RequestMapping("/guest/update")
	public String update(GuestDto dto) {
		//MemberDao 객체를 이용해서 DB에 저장
		dao.update(dto);
		//view page로 forward 이동해서 응답
		return "redirect:/guest/list";
	}
	
	@RequestMapping("/guest/updateform")
	public ModelAndView updateform(int num, ModelAndView mView) {
		GuestDto dto = dao.getData(num);
		mView.addObject("dto", dto);
		mView.setViewName("guest/updateform");
		return mView;
	}
	
	@RequestMapping("/guest/insert")
	public String insert(GuestDto dto) {
		//MemberDao 객체를 이용해서 DB에 저장
		dao.insert(dto);
		//view page로 forward 이동해서 응답
		return "guest/insert";
	}
	
	@RequestMapping("/guest/insertform")
	public String insertform() {
		return "guest/insertform";
	}
	
	@RequestMapping("/guest/list")
	public String list(HttpServletRequest request) {
		//회원 목록을 얻어와서
		List<GuestDto> list = dao.getList();
		//request scope에 담고
		request.setAttribute("list", list);
		// /WEB-INF/views/member/list.jsp 페이지로 forward 이동해서 응답
		return "guest/list";
	}
}
