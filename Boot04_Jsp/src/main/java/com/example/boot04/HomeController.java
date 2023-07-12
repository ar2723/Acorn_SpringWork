package com.example.boot04;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	@GetMapping("/fortune")
	public ModelAndView fortune(ModelAndView mView) {
		//오늘의 운세
		String fortuneToday = "동쪽으로 가면 귀인을 만나요!";
		//ModelAndView 객체에 모델과 view page의 정보를 담고
		//ModelAndView 객체로 모델을 담아서 전달해도 request 객체와 동일하게 request 객체로 추출해서 사용할 수 있다.
		mView.addObject("fortuneToday", fortuneToday);
		mView.setViewName("fortune");
		//리턴해준다.
		return mView;
	}
	
	@GetMapping("/fortune2")
	public String fortune2(HttpServletRequest request) {
		//오늘의 운세
		String fortuneToday = "동쪽으로 가면 귀인을 만나요!";
		request.setAttribute("fortuneToday", fortuneToday);
		//리턴해준다.
		return "fortune";
	}
}
