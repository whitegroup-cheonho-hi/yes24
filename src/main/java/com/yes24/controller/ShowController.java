package com.yes24.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/show")
public class ShowController {

	@RequestMapping(value = "/insertForm" ,method = RequestMethod.GET)
	public String showInsertForm() {
		System.out.println("showInsertForm()");
		
		return "admin/showInsertForm";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detailForm() {
		System.out.println("detailForm()");
		
		
		return "show/showDetail";
	}

}
