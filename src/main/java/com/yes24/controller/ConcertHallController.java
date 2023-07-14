package com.yes24.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yes24.service.ConcertHallService;
import com.yes24.vo.ConcertHallVO;

@Controller
@RequestMapping("/concertHall")
public class ConcertHallController {
	
	@Autowired
	private ConcertHallService concertHallService;
	@Autowired
	private ConcertHallVO concertHallVO;

	// -------------------- 공연장 등록폼
	@RequestMapping(value = "/concertHallInsertForm", method = RequestMethod.GET)
	public String concertHallInsertForm() {
		System.out.println("concertHallInsertForm()");

		return "admin/concertHallInsertForm";
	}

	// -------------------- 공연장 등록
	@RequestMapping(value = "/concertHallInsert", method = RequestMethod.POST)
	public String concertHallInsert(@ModelAttribute ConcertHallVO vo) {
		System.out.println("concertHallInsert()");

		int result = concertHallService.insertConcertHall(vo);

		return "";
	}

	// -------------------- 공연장 수정폼
	@RequestMapping(value = "/concertHallModifyForm/{no}", method = RequestMethod.GET)
	public String concertHallModifyForm(@PathVariable("no") int no, Model model) {
		System.out.println("concertHallModifyForm()");

		concertHallVO = concertHallService.getConcertHall(no);

		model.addAttribute("concertHall", concertHallVO);

		return "admin/concertHallModifyForm";
	}

	// -------------------- 공연장 수정
	@RequestMapping(value = "/concertHallModify", method = RequestMethod.POST)
	public String concertHallModify(@ModelAttribute ConcertHallVO vo) {
		System.out.println("concertHallModify()");
		
		String Uri = "redirect:/";
		int result = concertHallService.updateConcertHall(vo);
		
		if(result > 0) {
			Uri = "redirect:/show/showSeatClassModifyForm/"+result;
		}
			System.out.println(result);			
		return Uri;
	}
}
