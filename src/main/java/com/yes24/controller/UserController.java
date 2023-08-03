package com.yes24.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.service.UserService;
import com.yes24.vo.JsonResult;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private UserVO userVO;

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

		userVO = userService.loginUser(vo);

		if (userVO == null) {
			model.addAttribute("message", message);
			Uri = "user/login";
		} else {
			session.setAttribute("authUser", userVO);
			session.setMaxInactiveInterval(6000);

			int userRole = userVO.getUserRole();
			switch (userRole) {
			case 3:
				Uri = "redirect:/admin/adminShowList";
				break;
			case 2:
				Uri = "redirect:/admin/getTicketingList";
				break;
			default:
				Uri = "redirect:/";
				break;
			}
		}

		return Uri;

	}

	// ------------------- 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
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

		return "redirect:/user/loginForm";

	}

	// ------------------- 회원수정폼
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyForm(Model model, HttpSession session) {
		System.out.println("modifyForm()");

		UserVO vo = (UserVO) session.getAttribute("authUser");

		userVO.setUserSq(vo.getUserSq());

		UserVO user = userService.getUser(userVO);

		model.addAttribute("user", user);

		return "user/modifyForm";

	}

	// ------------------- 회원정보 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute UserVO vo) {
		System.out.println("modify()");

		int result = userService.modifyUser(vo);

		return "redirect:/user/modifyForm";

	}

	// ------------------- 회원정보 탈퇴
	@RequestMapping(value = "/delete/{no}", method = RequestMethod.GET)
	public String delete(@PathVariable("no") int no) {
		System.out.println("delete()");

		int result = userService.deleteUser(no);

		return "redirect:/user/logout";

	}

	// ------------------- 마이페이지
	@RequestMapping(value = "/myPage/{no}", method = RequestMethod.GET)
	public String myPageForm(Model model, HttpSession session, @PathVariable("no") int no) {
		System.out.println("myPage()");

		UserVO vo = (UserVO) session.getAttribute("authUser");
		UserVO user = userService.getUser(vo);

		model.addAttribute("user", user);

		return "user/myPage" + no;

	}

	// ------------------- 아이디중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public JsonResult idCheck(@RequestParam("id") String id) {
		System.out.println("idCheck()");

		JsonResult jsonResult = new JsonResult();

		boolean result = userService.idCheck(id);

		jsonResult.success(result);

		return jsonResult;
	}

}
