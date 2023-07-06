package com.yes24.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/",method =RequestMethod.GET)
	public String main() {
		System.out.println("main()");
		
		return "main/main";
		
	}
	
	@RequestMapping(value = "/category/{no}",method =RequestMethod.GET)
	public String category(@PathVariable("no")int no) {
		System.out.println("category()");
		
		return "main/category";
		
	}
}
