package com.yes24.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.vo.JsonResult;
import com.yes24.vo.TransferBoardVO;

@Controller
@RequestMapping("/transferTicket")
public class TransferTicketControll {
	
	// ---------------- 양도게시판
	@RequestMapping(value = "/transferBoardForm", method = RequestMethod.GET)
	public String transferBoardForm() {
		System.out.println("transferBoardForm()");

		return "main/transferBoard";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertTransferTicket",method = RequestMethod.POST)
	public JsonResult insertTransferTicket(@ModelAttribute TransferBoardVO vo) {
		System.out.println("insertTransferTicket()");
		System.out.println(vo);
		
		JsonResult jsonResult = new JsonResult();
		
		return jsonResult;
		
	}

}
