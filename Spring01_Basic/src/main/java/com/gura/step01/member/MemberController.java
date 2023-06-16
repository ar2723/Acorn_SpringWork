package com.gura.step01.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//아래의 선언에 따라 Controller 클래스를 상속받은 것과 동일하다
@Controller
public class MemberController {
	
	// "/member/insertform" 요청을 처리할 메소드 만들기
	@RequestMapping("/member/insertform")
	public String insertform() {
		//응답할 jsp 페이지의 위치를 리턴해주면 된다.
		return "member/insertform";
	}
	/*
	 * [ 요청 파라미터 추출하는 방법1]
	 * HttpServletRequest 객체를 Controller 메소드로 전달 받아서 직접 추출한다.
	 */
	@RequestMapping("/member/insert")
	public String insert(HttpServletRequest request) throws UnsupportedEncodingException {
		//폼 전송되는 파라미터 추출하기
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		
		System.out.println(num + "|" + name + "|" + addr);
		
		return "member/insert";
	}
	
	@RequestMapping("/member/insert2")
					//만약에 num에 숫자가 아닌 문자를 넣으면 400번 오류가 발생한다.
	public String insert2(int num, String name, String addr) {
		
		System.out.println(num + "|" + name + "|" + addr);
		return "member/insert";
	}
   /*
    *  [ 요청 파라미터 추출하는 방법 2 ]
    *  
    *  파라미터명과 동일하게 메소드의 매개변수를 선언해 놓으면 자동으로 추출해서 넣어준다.
    *  
    *  <input name="num">  이면  int num or String num
    *  <input name="email"> 이면  String email  이런 식으로 선언 하면 된다. 
    */
	
	@RequestMapping("/member/insert3")
	//만약에 num에 숫자가 아닌 문자를 넣으면 400번 오류가 발생한다.
	public String insert3(MemberDto dto) {
		int num = dto.getNum();
		String name = dto.getName();
		String addr = dto.getAddr();
		
		System.out.println(num + "|" + name + "|" + addr);
		return "member/insert";
	}
	
	/*
     *  [ 요청 파라미터 추출하는 방법 3 ]
     *  
     *  파라미터명과 동일한 필드명을 가지고 있는 dto 클래스 type 을  메소드의 매개변수로 선언해 놓으면
     *  자동으로 추출해서 dto 에  추출한 값을 setter 메소드를 이용해서 넣은 다음  해당 dto 객체의 
     *  참조값이 전달된다. (즉, setter 메소드를 일일이 적을 필요가 없다)
     *  
     *  pulic class MemberDto{
     *     private int num;  => <input name="num">
     *     private String name; => <input name="name">
     *     private String addr; => <input name="addr">
     *  }
     *  
     */
	
	@RequestMapping("/member/delete")
	public String delete(int num) {
		/*
		 * 리다이렉트 응답할 때는 "redirect: 새로운 경로" 형식으로 view page 정보를 작성하면 된다.
		 */
		System.out.println(num + " 번 회원을 삭제 합니다");
		return "redirect:/";
	}
}
