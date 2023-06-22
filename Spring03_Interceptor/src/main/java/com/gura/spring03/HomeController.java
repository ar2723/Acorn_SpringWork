package com.gura.spring03;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//놀러가기 요청처리
	@RequestMapping("/play")
	public String play() {
		return "play";
	}

	//이 프로젝트의 (root)최상위 경로 요청이 오면
	@RequestMapping(value = "/")
	//전달할 타입의 매개변수가 있다면 ()안에 선언해놓으면 클래스 선언없이 자동으로 전달이된다.
	public String home(HttpServletRequest request) {
		//home.jsp 페이지에서 필요한 모델(data)를 HttpServeltRequest 객체에 담아두기
		List<String> list = new ArrayList<String>();
		list.add("날씨가 많이 더워지고 있어요");
		list.add("집에 가서 공부해야겠지...?");
		list.add("올해안에 취업하려면 열심히 해야지...?");
		
		//home.jsp 페이지에서 필요한 모델(data)를 HttpServletRequest 객체에 담아두기
		request.setAttribute("list", list);
		
		// /WEB-INF/views/home.jsp 페이지로 forward 이동해서 응답하겠다는 의미
		// "home" 이라는 문자열을 리턴하면 앞에 "/WEB-INF/views/" 뒤에 ".jsp" 가 자동으로 붙는다.
		// 따라서 다른 요청 페이지 링크 작성시에 주소 끝에 .jsp를 붙이게 되면 중복이 되기 때문에 404 오류가 붙게 된다.
		return "home";
	}
}
