package com.yes24.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yes24.service.ConcertHallService;
import com.yes24.vo.ConcertHallVO;

@Controller
@RequestMapping("/concertHall")
public class ConcertHallController {
	
	@Autowired
	private ConcertHallService concertHallService;

	@RequestMapping(value = "/insertConcertHallForm", method = RequestMethod.GET)
	public String insertConcertHallForm() {
		System.out.println("insertConcertHallForm()");
		
		return "admin/concertHallInsertForm";		
	}
	
	@RequestMapping(value = "/insertConcertHall",method = RequestMethod.POST)
		public String insertConcertHall(@ModelAttribute ConcertHallVO vo) {
		System.out.println("insertConcertHall()");
		System.out.println(vo);
		int result = concertHallService.insertConcertHall(vo);
	
		return "";
	}
}