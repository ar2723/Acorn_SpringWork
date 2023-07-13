package com.example.boot07.cafe.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.boot07.cafe.dto.CafeCommentDto;
import com.example.boot07.cafe.dto.CafeDto;
import com.example.boot07.cafe.service.CafeService;

@Controller
public class CafeController {
	@Autowired
	private CafeService service;
	
	
	//새로운 댓글 저장 요청 처리
	@PostMapping("/cafe/comment_insert")
	//request 객체에는 ref_group, target_id, content가 담기고, ref_group에도 마찬가지로 동일명의 파라미터 값이 담긴다.
	public String commentInsert(HttpServletRequest request, int ref_group) {
		//새로운 댓글을 저장하는 로직을 수행한다.
		service.saveComment(request);
		//ref_group은 원글의 글 번호이기 때문에 원글 자세히 보기로 다시 리다이렉트 이동된다.
		return "redirect:/cafe/detail?num="+ref_group;
	}
	
	@GetMapping("/cafe/ajax_comment_list")
	public String commentList(HttpServletRequest request) {
		
		//테스트를 위해 시간 지연 시키기
		try {
			Thread.sleep(1000);
		} catch(InterruptedException e) {
			e.printStackTrace();
		}
		service.moreCommentList(request);
		return "cafe/ajax_comment_list";
	}
	
	@ResponseBody
	@PostMapping("/cafe/comment_update")
	public Map<String, Object> commentUpdate(CafeCommentDto dto) {
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<String, Object>();
	    map.put("isSuccess", true);
	    //{"isSuccess": true} 형식의 JSON 문자열이 응답되도록 한다.
	    return map;
	}
	
	@ResponseBody
	@PostMapping("/cafe/comment_delete")
	public Map<String, Object> commentDelete(HttpServletRequest request) {
		service.deleteComment(request);
		Map<String, Object> map=new HashMap<String, Object>();
	    map.put("isSuccess", true);
	    //{"isSuccess": true} 형식의 JSON 문자열이 응답되도록 한다.
	    return map;
	}
	
	@GetMapping("/cafe/list")
	public String getList(HttpServletRequest request, Model model) {
		//서비스에 HttpServletRequest 객체를 전달해서 응답에 필요한 데이터가 담기도록 하고
		service.getList(request, model);
		//view page로 forward 이동해서 응답하기
		return "cafe/list";
	}
	
	@GetMapping("/cafe/insertform")
	public String insertform() {
		return "cafe/insertform";
	}
	
	@PostMapping("/cafe/insert")
	public String insert(CafeDto dto, HttpServletRequest request) {
		//아래의 코드 대신에 String writer=(String)session.getAttribute("id") 같이
		//session 객체를 활용해서 로그인 되어 있는 정보를 추출해서 dto에 담는 것도 가능하다.
		String writer=(String)request.getSession().getAttribute("id");
		dto.setWriter(writer);
		service.saveContent(dto);
		return "cafe/insert";
	}
	
	@GetMapping("/cafe/detail")
	public String detail(HttpServletRequest request, Model model) {
		service.getDetail(request, model);
		return "cafe/detail";
	}
	
	@GetMapping("/cafe/updateform")
	public String updateform(HttpServletRequest request) {
		service.getData(request);
		return "cafe/updateform";
	}
	
	@PostMapping("/cafe/update")
	public ModelAndView update(CafeDto dto, ModelAndView mView) {
		service.updateContent(dto);
		mView.setViewName("cafe/update");
		return mView;
	}
	
	@GetMapping("/cafe/delete")
	public ModelAndView delete(int num, ModelAndView mView, HttpServletRequest request) {
		//서비스에 삭제할 글번호와 HttpServletRequest 객체를 전달해서 해당 글을 삭제시키고
		service.deleteContent(num, request);
		//글 목록 보기로 리다이렉트 이동 시킨다.
		mView.setViewName("redirect:/cafe/list");
		return mView;
	}
	
}
