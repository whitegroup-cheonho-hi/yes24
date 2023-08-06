package com.yes24.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yes24.service.ConcertHallService;
import com.yes24.service.UserService;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/concertHall")
public class ConcertHallController {

	@Autowired
	private ConcertHallService concertHallService;
	@Autowired
	private ConcertHallVO concertHallVO;
	@Autowired
	private UserService userService;

	// -------------------- 공연장 등록폼
	@RequestMapping(value = "/concertHallInsertForm", method = RequestMethod.GET)
	public String concertHallInsertForm(HttpSession session) {
		System.out.println("concertHallInsertForm()");

		String Uri = "admin/concertHallInsertForm";
		Uri = loginCheck(Uri, session);

		return Uri;
	}

	// -------------------- 공연장 등록
	@RequestMapping(value = "/concertHallInsert", method = RequestMethod.POST)
	public String concertHallInsert(@ModelAttribute ConcertHallVO vo) {
		System.out.println("concertHallInsert()");

		int result = concertHallService.insertConcertHall(vo);

		return "redirect:/admin/getConcertHallList";
	}

	// -------------------- 공연장 수정폼
	@RequestMapping(value = "/concertHallModifyForm/{no}", method = RequestMethod.GET)
	public String concertHallModifyForm(@PathVariable("no") int no, Model model, HttpSession session) {
		System.out.println("concertHallModifyForm()");

		String Uri = "admin/concertHallModifyForm";
		Uri = loginCheck(Uri, session);

		concertHallVO = concertHallService.getConcertHall(no);

		model.addAttribute("concertHall", concertHallVO);

		return Uri;
	}

	// -------------------- 공연장 수정
	@RequestMapping(value = "/concertHallModify", method = RequestMethod.POST)
	public String concertHallModify(@ModelAttribute ConcertHallVO vo) {
		System.out.println("concertHallModify()");

		String Uri = "redirect:/concertHall/concertHallModifyForm/" + vo.getConcertHallSq();
		int showSq = concertHallService.updateConcertHall(vo);

		if (showSq > 0) {
			Uri = "redirect:/show/showSeatClassModifyForm/" + showSq;
		}

		return Uri;
	}
	
	// --------------- 공연장 삭제
	@RequestMapping(value = "/concertHallDelete/{no}", method = RequestMethod.GET)
	public String concertHallDelete(HttpSession session, @PathVariable("no") int no) {
		System.out.println("concertHallDelete()");

		String Uri = "redirect:/admin/getConcertHallList";
		Uri = loginCheck(Uri, session);
		
		concertHallService.deleteConcertHall(no);

		return Uri;
	}

	// 로그인 체크
	public String loginCheck(String Uri, HttpSession session) {

		UserVO userVO = (UserVO) session.getAttribute("authUser");

		if (userVO == null) {

			Uri = "redirect:/user/loginForm";
		} else {

			UserVO vo = userService.getUser(userVO);

			if (vo.getUserRole() == 1) {

				Uri = "redirect:/";
			}

		}
		return Uri;
	}
}
