package com.gura.spring02.guest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring02.guest.dao.GuestDao;
import com.gura.spring02.guest.dto.GuestDto;
import com.gura.spring02.guest.service.GuestService;

@Controller
public class GuestController {
	//컨트롤러는 비즈니스 로직을 대신 처리해주는 서비스에 의존한다.
	@Autowired
	private GuestService service;
	
	@RequestMapping("/guest/delete")
	public String delete(GuestDto dto) {
		service.deleteGuest(dto);
		return "redirect:/guest/list";
	}
	
//	@RequestMapping("/guest/deleteform")
//	public String deleteform(int num) {
//		return "guest/deleteform";
//	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/guest/update")
	public String update(GuestDto dto) {
		//GuestDao 객체를 이용해서 DB를 수정
		service.updateGuest(dto);
		//view page로 forward 이동해서 응답
		return "guest/update";
	}
	
	//여기서 updateform 매개변수에서 생성된 mView는 
	//하나의 사물함 키값(참조값)으로 service와 controller가 같은 객체의 참조값에 접근하고 있다.
	@RequestMapping("/guest/updateform")
	public ModelAndView updateform(int num, ModelAndView mView) {
		//서비스를 이용해서 ModelAndView 객체에 글하나의 정보를 담아온다
		service.getGuestInfo(mView, num);
		//view page로 forward 이동해서 수정폼 응답하기
		mView.setViewName("guest/updateform");
		return mView;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/guest/insert")
	public String insert(GuestDto dto) {
		//GuestDao 객체를 이용해서 DB에 저장
		service.addGuest(dto);
		//view page로 forward 이동해서 응답
		return "guest/insert";
	}
	
	@RequestMapping("/guest/insertform")
	public String insertform() {
		return "guest/insertform";
	}
	
	@RequestMapping("/guest/list")
	public ModelAndView list(ModelAndView mView) {
		//서비스를 이용해서 ModelAndView 객체에 글목록의 정보를 담아온다
		service.getGuestList(mView);
		//view page 정보도 담고
		mView.setViewName("guest/list");
		return mView;
		/*
		 * 	두개의 정보가 모두 담긴 ModelAndView 객체를 리턴해주면
		 * 	addObject(key, value)를 통해서 담은 정보는 request scope에 담기고
		 * 	setViewName(view page 위치)를 통해서 담은 정보는 해당 view page로 forward 이동해서 응답된다.
		 */
	}
}
