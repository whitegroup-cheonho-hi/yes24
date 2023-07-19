package com.yes24.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.vo.JsonResult;
import com.yes24.vo.SaveTicketVO;

@Controller
@RequestMapping("/ticketing")
public class TicketingController {

	@ResponseBody
	@RequestMapping(value = "/insertTicketing" , method = RequestMethod.POST)
	public JsonResult insertTicketing(@ModelAttribute SaveTicketVO vo) {
		System.out.println("insertTicketing()");
		System.out.println(vo);
		
		
		JsonResult jsonResult = new JsonResult();
		
		return jsonResult;
	}
}
