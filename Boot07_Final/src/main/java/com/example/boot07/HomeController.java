package com.example.boot07;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home(HttpServletRequest request) {
		List<String> list = new ArrayList<String>();
		list.add("Spring Boot 시작 입니다.");
		list.add("다음주에 시험이야");
		list.add("공부해야겠지...?");
		
		request.setAttribute("list", list);
		
		return "home";
	}
	
}
