package com.yes24.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.service.TransferBoardService;
import com.yes24.vo.JsonResult;
import com.yes24.vo.TransferBoardVO;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/transferTicket")
public class TransferTicketControll {

	@Autowired
	private TransferBoardService transferBoardService;

	// ---------------- 양도게시판
	@RequestMapping(value = "/transferBoardForm", method = RequestMethod.GET)
	public String transferBoardForm() {
		System.out.println("transferBoardForm()");

		return "main/transferBoard";
	}

	@ResponseBody
	@RequestMapping(value = "/insertTransferTicket", method = RequestMethod.POST)
	public JsonResult insertTransferTicket(@ModelAttribute TransferBoardVO vo, HttpSession session) {
		System.out.println("insertTransferTicket()");

		UserVO userVO = (UserVO) session.getAttribute("authUser");

		vo.setBuyUserSq(userVO.getUserSq());

		int result = transferBoardService.insertTransferboard(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(result);

		return jsonResult;

	}

}
