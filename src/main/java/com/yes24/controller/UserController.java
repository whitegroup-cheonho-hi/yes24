package com.yes24.controller;

import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	
	//------------------- 로그인 폼	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		System.out.println("loginForm()");
		
		return "user/login";
		
	}
	
	//------------------- 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute UserVO vo) {
		System.out.println("login()");
		
		return "user/login";
		
	}

	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinFrom() {
		System.out.println("joinForm()");
		
		return "user/joinForm";
		
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute UserVO vo) {
		System.out.println("join()");
	
		
		return "redirect:/user/login";
		
	}
	
	
	
}
