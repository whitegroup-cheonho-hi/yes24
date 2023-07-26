package com.yes24.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.service.AlarmService;
import com.yes24.vo.AlarmVO;
import com.yes24.vo.JsonResult;
import com.yes24.vo.ShowVO;

@RequestMapping("/alarm")
@Controller
public class AlarmController {

	@Autowired
	private AlarmService alarmService;

	// ----------------- 양도 알림 신청
	@RequestMapping(value = "/insertAlarm", method = RequestMethod.POST)
	public String insertAlarm(@ModelAttribute AlarmVO vo) {
		System.out.println("insertAlarm()");
		System.out.println(vo);
		
		
		return "";

	}

	// ------------------ 제목 검색으로 공연리스트
	@ResponseBody
	@RequestMapping(value = "/getShowName", method = RequestMethod.POST)
	public JsonResult getShowName(@RequestParam("showName")String showName) {
		System.out.println("getShowName()");
		
		List<ShowVO> showNameList = alarmService.getShowName(showName); 
		System.out.println(showNameList);
		JsonResult jsonResult = new JsonResult();
		
		jsonResult.success(showNameList);

		return jsonResult;

	}

}
