package com.example.boot07.users.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.boot07.users.dto.UsersDto;
import com.example.boot07.users.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	
	@GetMapping("/users/signup_form")
	public String signupForm() {
		
		return "users/signup_form";
	}
	
	//회원 가입 요청처리
	@PostMapping("/users/signup")
	public String signup(UsersDto dto) {
		//서비스를 이용해서 DB에 저장
		service.addUser(dto);
		return "users/signup";
	}
	
	//로그인 폼 요청처리
	@GetMapping("/users/loginform")
	public String loginForm() {
		return "users/loginform";
	}
	
	@PostMapping("/users/login")
	public String login(Model model, UsersDto dto, String url, HttpSession session){
		/*
		 * 서비스에서 비즈니스 로직을 처리할 때 필요로 하는 객체를 컨트롤러에서 직접 전달을 해주어야 한다.
		 * 주로, HttpServletRequest, HttpServletResponse, HttpSession, ModelAndView
		 * 등등의 객체이다.
		 */
		service.loginprocess(dto, session);
		
		//로그인 후에 가야할 목적지 정보를 인코딩하지 않은 것과 인코딩 한것을 모두 ModelAndView 객체에 담고
		String encodeUrl = URLEncoder.encode(url);
		model.addAttribute("url", url);
		model.addAttribute("encodedUrl", encodeUrl);
	
		return "users/login";
   	}
	
	//로그아웃 요청 처리
	@GetMapping("/users/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "users/logout";
	};
	
	//개인정보 보기 요청 처리
	@GetMapping("/users/info")
	public String info(Model model, HttpSession session) {
		service.getInfo(session, model);
		return "users/info";
	}
	
	//비밀번호 수정폼 요청 처리
	@GetMapping("/users/pwd_updateform")
	public String pwdUpdateForm() {
		return "users/pwd_updateform";
	}
	
	//비밀번호 수정 요청 처리
	@PostMapping("/users/pwd_update")
	public String pwdUpdate(UsersDto dto, Model model, HttpSession session) {
		//서비스에 필요한 객체의 참조값을 전달해서 비밀번호 수정 로직을 처리한다.
		service.updateUserPwd(session, dto, model);
		//view page로 forward 이동해서 작업 결과를 응답한다.
		return "users/pwd_update";
	}
	
	//개인정보 수정폼 요청 처리
	@GetMapping("/users/updateform")
	public String updateform(HttpSession session, Model model) {
		service.getInfo(session, model);
		return "users/updateform";
	}
	
	//ajax 프로필 사진 업로드 요청처리
	@PostMapping("/users/profile_upload")
	@ResponseBody
	public Map<String, Object> profileUpload(HttpServletRequest request, MultipartFile image){
		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map을 리턴해서 json 문자열 응답하기
		return service.saveProfileImage(request, image);
	};
	
	//개인정보 수정 요청 처리
	@PostMapping("/users/update")
	public String update(UsersDto dto, HttpSession session) {
		//서비스를 이용해서 개인정보를 수정하고
		service.updateUser(dto, session);
		//개인정보 보기로 리다이렉트 이동시킨다.
		return "redirect:/users/info";
	}
	
	//회원 탈퇴 요청 처리
	@GetMapping("/users/delete")
	public String delete(HttpSession session, Model model) {
		/*
		 * 컨트롤러의 메소드로 전달받은 Model 객체를 서비스 객체에 전달해서
		 * view page에 전달한 data(모델)이 담기도록 해야한다.
		 * Model 객체에 addAttribute() 해서 담은 data는 Spring 프레임워크가
		 * HttpServletRequest 객체에 setAttribute()해서 대신 담아준다.
		 * 따라서 forward 이동된 (응답을 위임받은) jsp 페이지에서 해당 data를 사용할 수 있는 것이다.
		 */
		service.deleteUser(session, model);
		return "users/delete";
	}
}
