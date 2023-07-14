package com.yes24.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yes24.service.ShowService;
import com.yes24.vo.ShowVO;

@Controller
public class MainController {
	
	/* 테스트 */
	
	@Autowired
	private ShowService showService;
	@Autowired
	private List<ShowVO> showList;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		System.out.println("main()");
		
		//나중에 개봉예정작으로 수정해야함
		showList = showService.getShowList(1);
		
		model.addAttribute("showList", showList);
		
		return "main/main";

	}

	@RequestMapping(value = "/category/{no}", method = RequestMethod.GET)
	public String category(@PathVariable("no") int no,Model model) {
		System.out.println("category()");
		
		showList = showService.getShowList(no);
	
		model.addAttribute("showList", showList);

		return "main/category";

	}
	
}
