package com.yes24.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yes24.service.MyPageService;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;

	// ---------------- 마이페이지 예매확인
	@RequestMapping(value = "/myTicketingList", method = RequestMethod.GET)
	public String myTicketingList(HttpSession session, Model model) {
		System.out.println("myTicketingList()");

		UserVO userVO = (UserVO) session.getAttribute("authUser");
		// 파라미터 1은 예매
		Map<String, Object> map = myPageService.myTicketingList(userVO.getUserSq(), userVO, 1);

		model.addAttribute("myTicketingList", map.get("myTicketingList"));
		model.addAttribute("myTransferTicketList", map.get("myTransferTicketList"));
		model.addAttribute("user", map.get("userVO"));

		return "user/myPage1";

	}

	// ---------------- 마이페이지 관람공연
	@RequestMapping(value = "/myViewingShowList", method = RequestMethod.GET)
	public String myViewingShowList(HttpSession session, Model model) {
		System.out.println("myViewingShowList()");

		UserVO userVO = (UserVO) session.getAttribute("authUser");
		// 파라미터 2는 관람완료
		Map<String, Object> map = myPageService.myTicketingList(userVO.getUserSq(), userVO, 2);

		model.addAttribute("myTicketingList", map.get("myTicketingList"));
		model.addAttribute("user", map.get("userVO"));

		return "user/myPage2";

	}

	// ---------------- 마이페이지 나의알림함
	@RequestMapping(value = "/myNotificationList", method = RequestMethod.GET)
	public String myNotificationList(HttpSession session, Model model) {
		System.out.println("myNotificationList()");

		UserVO userVO = (UserVO) session.getAttribute("authUser");

		Map<String, Object> map = myPageService.myTicketingList(userVO.getUserSq(), userVO, 5);

		model.addAttribute("user", map.get("userVO"));
		model.addAttribute("alarmList", map.get("alarmList"));
		model.addAttribute("notificationList", map.get("notificationList"));

		return "user/myPage3";

	}
}
