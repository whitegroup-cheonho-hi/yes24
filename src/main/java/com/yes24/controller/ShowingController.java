package com.yes24.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.service.ShowingService;
import com.yes24.vo.JsonResult;
import com.yes24.vo.ShowingVO;

@Controller
@RequestMapping("/showing")
public class ShowingController {
	
	private ShowingService showingService;
	
	@ResponseBody
	@RequestMapping(value = "/getShowing",method = RequestMethod.POST)
	public JsonResult getShowing(@ModelAttribute ShowingVO vo) {
		System.out.println("getShowing");
		
		List<ShowingVO> showingList = showingService.getShowing(vo);
		
		System.out.println(showingList);
		
		JsonResult jsonResult = new JsonResult();
		
		return jsonResult;		
		
	}

}
