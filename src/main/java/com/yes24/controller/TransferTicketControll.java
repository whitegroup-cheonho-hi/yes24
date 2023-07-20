package com.yes24.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/transferTicket")
public class TransferTicketControll {

	@RequestMapping(value = "/transferBoardForm", method = RequestMethod.GET)
	public String transferBoardForm() {
		System.out.println("transferBoardForm()");

		return "main/transferBoard";
	}

}
