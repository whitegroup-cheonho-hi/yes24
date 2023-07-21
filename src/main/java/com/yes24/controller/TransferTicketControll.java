package com.yes24.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.vo.JsonResult;

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
	@RequestMapping(value = "/insertTransferTicket",method = RequestMethod.GET)
	public JsonResult insertTransferTicket(@RequestParam("ticketSq")int no) {
		System.out.println("insertTransferTicket()");
		System.out.println(no);
		
		JsonResult jsonResult = new JsonResult();
		
		return jsonResult;
		
	}

}
