package com.yes24.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.service.TicketingService;
import com.yes24.vo.JsonResult;
import com.yes24.vo.SaveTicketVO;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/ticketing")
public class TicketingController {

	@Autowired
	private TicketingService ticketingService;

	// ----------------- 예매 등록
	@ResponseBody
	@RequestMapping(value = "/insertTicketing", method = RequestMethod.GET)
	public JsonResult insertTicketing(HttpSession session) {
		System.out.println("insertTicketing()");

		UserVO userVO = (UserVO) session.getAttribute("authUser");

		int ticketingSq = ticketingService.insertTicketing(userVO.getUserSq());

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(ticketingSq);

		return jsonResult;
	}

	// ----------------- 예매 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteTicketing", method = RequestMethod.GET)
	public JsonResult deleteTicketing(HttpSession session) {
		System.out.println("deleteTicketing()");

		UserVO userVO = (UserVO) session.getAttribute("authUser");

		int result = ticketingService.deleteTicketing(userVO);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(result);

		return jsonResult;
	}

	// -------------- 티켓등록
	@ResponseBody
	@RequestMapping(value = "/insertTicket", method = RequestMethod.POST)
	public JsonResult insertTicket(HttpSession session,@ModelAttribute SaveTicketVO vo) {
		System.out.println("insertTicket()");
				
		int result = ticketingService.insertTicket(vo);
		
		JsonResult jsonResult = new JsonResult();

		return jsonResult;
	}
}
