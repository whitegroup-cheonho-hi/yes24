package com.yes24.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yes24.service.UserService;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	// ------------------- 로그인폼
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		System.out.println("loginForm()");

		return "user/login";

	}

	// ------------------- 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute UserVO vo, HttpSession session, Model model) {
		System.out.println("login()");
		String message = "아이디 또는 비밀번호를 잘못입력했습니다. \n<br> 입력하신 내용을 다시 확인해주세요.";
		String Uri = "";

		UserVO userVO = userService.loginUser(vo);

		if (userVO == null) {
			model.addAttribute("message", message);
			Uri = "user/login";
		} else {
			session.setAttribute("authUser", userVO);
			session.setMaxInactiveInterval(6000);
			Uri = "redirect:/";
		}

		return Uri;

	}

	// ------------------- 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpSession session) {
		System.out.println("logout()");

		session.removeAttribute("authUser");
		session.invalidate();

		return "redirect:/";

	}

	// ------------------- 회원가입폼
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinFrom() {
		System.out.println("joinForm()");

		return "user/joinForm";

	}

	// ------------------- 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute UserVO vo) {
		System.out.println("join()");

		int result = userService.insertUser(vo);

		System.out.println(result);

		return "redirect:/user/loginForm";

	}

}
