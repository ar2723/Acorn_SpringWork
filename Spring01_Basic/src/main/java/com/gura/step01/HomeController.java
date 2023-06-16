package com.gura.step01;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//이 프로젝트의 (root)최상위 경로 요청이 오면
	@RequestMapping(value = "/")
	//전달할 타입의 매개변수가 있다면 ()안에 선언해놓으면 클래스 선언없이 자동으로 전달이된다.
	public String home(HttpServletRequest request) {
		//home.jsp 페이지에서 필요한 모델(data)를 HttpServeltRequest 객체에 담아두기
		List<String> list = new ArrayList<String>();
		list.add("날씨가 많이 더워지고 있어요");
		list.add("어쩌고,,,");
		list.add("저쩌고...");
		
		//home.jsp 페이지에서 필요한 모델(data)를 HttpServletRequest 객체에 담아두기
		request.setAttribute("list", list);
		
		// /WEB-INF/views/home.jsp 페이지로 forward 이동해서 응답하겠다는 의미
		// "home" 이라는 문자열을 리턴하면 앞에 "/WEB-INF/views/" 뒤에 ".jsp" 가 자동으로 붙는다.
		return "home";
	}
}
