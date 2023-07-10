package com.yes24.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yes24.service.ShowService;
import com.yes24.vo.ShowVO;

@Controller
@RequestMapping("/show")
public class ShowController {

	@Autowired
	private ShowService showService;
	@Autowired
	private ShowVO showVO;

	@RequestMapping(value = "/showInsertForm", method = RequestMethod.GET)
	public String showInsertForm(@ModelAttribute ShowVO vo) {
		System.out.println("showInsertForm()");

		return "admin/showInsertForm";
	}

	@RequestMapping(value = "/insertShow", method = RequestMethod.POST)
	public String insertShow(@ModelAttribute ShowVO vo, @RequestParam("file1") MultipartFile file1,
			@RequestParam("file2") MultipartFile file2) {
		System.out.println("insertShow()");

		showService.insertShow(vo, file1, file2);

		return "";
	}

	@RequestMapping(value = "/detail/{no}", method = RequestMethod.GET)
	public String detailForm(@PathVariable("no") int no, Model model) {
		System.out.println("detailForm()");

		showVO = showService.getShow(no);
		System.out.println(showVO);
		
		model.addAttribute("show", showVO);
		

		return "show/showDetail";
	}

}
