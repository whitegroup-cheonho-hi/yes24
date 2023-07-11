package com.yes24.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@RequestMapping(value = "/concertHallInsertForm", method = RequestMethod.GET)
	public String concertHallInsertForm() {
		System.out.println("concertHallInsertForm()");

		return "admin/concertHallInsertForm";
	}

	@RequestMapping(value = "/concertHallInsert", method = RequestMethod.POST)
	public String concertHallInsert(@ModelAttribute ConcertHallVO vo) {
		System.out.println("concertHallInsert()");
		
		int result = concertHallService.insertConcertHall(vo);

		return "";
	}

	@RequestMapping(value = "/concertHallModifyForm",method = RequestMethod.GET)
	public String concertHallModifyForm(Model model) {
		System.out.println("concertHallModifyForm()");
		
		
		
		
		return "admin/concertHallModifyForm";
	}

}
