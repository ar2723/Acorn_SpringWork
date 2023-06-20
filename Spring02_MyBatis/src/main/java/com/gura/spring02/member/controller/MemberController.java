package com.gura.spring02.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gura.spring02.member.dao.MemberDao;
import com.gura.spring02.member.dto.MemberDto;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDao dao; // <- new MemberDaoImpl() 가 생성되어 dao에 자동으로 들어간다.
						   // 이는 컴포넌트 스캔에 의해 bean으로 저장되어 관리되고 있기 때문이다.
	//회원추가 요청 처리
	@RequestMapping("/member/insert")
	public String insert(MemberDto dto) {
		//MemberDao 객체를 이용해서 DB에 저장
		dao.insert(dto);
		//view page로 forward 이동해서 응답
		return "member/insert";
	}
	
	//회원추가 폼 요청 처리
	@RequestMapping("/member/insertform")
	public String insertform() {
		return "member/insertform";
	}
	
	@RequestMapping("/member/update")
	public String update(MemberDto dto) {
		//MemberDao 객체를 이용해서 DB에 저장
		dao.update(dto);
		//view page로 forward 이동해서 응답
		return "member/update";
	}
	
	//회원 삭제 요청 처리
	@RequestMapping("/member/delete")
	public String update(int num, HttpServletRequest request) {
		dao.delete(num);
		List<MemberDto> list = dao.getList();
		request.setAttribute("list", list);
		return "member/list";
	}
	
	//회원추가 폼 요청 처리
	@RequestMapping("/member/updateform")
	public String updateform(int num, HttpServletRequest request) {
		MemberDto dto = dao.getData(num);
		request.setAttribute("dto", dto);
		return "member/updateform";
	}
	
	//회원 목록 보기 요청 처리
	@RequestMapping("/member/list")
	public String list(HttpServletRequest request) {
		//회원 목록을 얻어와서
		List<MemberDto> list = dao.getList();
		//request scope에 담고
		request.setAttribute("list", list);
		// /WEB-INF/views/member/list.jsp 페이지로 forward 이동해서 응답
		return "member/list";
	}
}
