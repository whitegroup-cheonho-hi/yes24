package com.yes24.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.vo.JsonResult;
import com.yes24.vo.ShowingVO;

@Controller
@RequestMapping("/showing")
public class ShowingController {
	
	@ResponseBody
	@RequestMapping(value = "/getShowing",method = RequestMethod.POST)
	public JsonResult getShowing(@ModelAttribute ShowingVO vo) {
		System.out.println("getShowing");
		
		System.out.println(vo);
		
		
		
		JsonResult jsonResult = new JsonResult();
		
		return jsonResult;		
		
	}

}
