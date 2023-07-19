package com.yes24.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yes24.vo.SaveTicketVO;

@Controller
@RequestMapping("/ticketing")
public class TicketingController {

	@RequestMapping(value = "/insertTicketing" , method = RequestMethod.POST)
	public String insertTicketing(@ModelAttribute SaveTicketVO vo) {
		System.out.println("insertTicketing()");
		System.out.println(vo);
		
		
		return "";
	}
}
