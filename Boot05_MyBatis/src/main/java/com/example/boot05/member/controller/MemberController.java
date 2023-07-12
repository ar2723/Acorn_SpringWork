package com.example.boot05.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.boot05.member.dao.MemberDao;
import com.example.boot05.member.dto.MemberDto;

@Controller
public class MemberController {
	@Autowired MemberDao dao;
	
	@GetMapping("/member/list")
	public ModelAndView getList(ModelAndView mView) {
		List<MemberDto> list = dao.getList();
		mView.addObject("list", list);
		mView.setViewName("member/list");
		return mView;
	}
	
	@GetMapping("/member/insertForm")
	public String insertForm() {
		return "member/insertForm";
	}
	
	@PostMapping("/member/insert")
	public String insert(MemberDto dto) {
		dao.insert(dto);
		return "redirect:/member/list";
	}
	
	@GetMapping("/member/delete")
	public String delete(int num) {
		dao.delete(num);
		return "redirect:/member/list";
	}
	
	@GetMapping("/member/updateForm")
	public String updateForm(int num, HttpServletRequest request) {
		dao.getData(num, request);
		return "member/updateForm";
	}
	
	@PostMapping("/member/update")
	public String update(MemberDto dto) {
		dao.update(dto);
		return "redirect:/member/list";
	}
}
