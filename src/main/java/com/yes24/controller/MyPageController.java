package com.yes24.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yes24.service.MyPageService;
import com.yes24.vo.MyTicketingVO;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;

	@RequestMapping(value = "/myTicketingList", method = RequestMethod.GET)
	public String myTicketingList(HttpSession session, Model model) {
		System.out.println("myTicketingList()");
		
		UserVO userVO = (UserVO) session.getAttribute("authUser");
		
		List<MyTicketingVO> myTicketingList = myPageService.myTicketingList(userVO.getUserSq());
				
		model.addAttribute("myTicketingList", myTicketingList);
		
		return "user/myPage1";
		
	}
}
