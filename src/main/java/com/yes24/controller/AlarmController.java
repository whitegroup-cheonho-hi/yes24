package com.yes24.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowVO;
import com.yes24.vo.UserVO;

import oracle.net.aso.a;

@RequestMapping("/alarm")
@Controller
public class AlarmController {

	@Autowired
	private AlarmService alarmService;

	// ----------------- 양도 알림 신청
	@RequestMapping(value = "/insertAlarm", method = RequestMethod.POST)
	public String insertAlarm(@ModelAttribute AlarmVO vo, HttpSession session) {
		System.out.println("insertAlarm()");

		UserVO userVO = (UserVO) session.getAttribute("authUser");

		vo.setUserSq(userVO.getUserSq());

		int result = alarmService.insertAlarm(vo);

		// return "redirect:/user/myPage/1";

		return "";

	}

	// ------------------ 제목 검색으로 공연리스트
	@ResponseBody
	@RequestMapping(value = "/getShowName", method = RequestMethod.POST)
	public JsonResult getShowName(@RequestParam("showName") String showName) {
		System.out.println("getShowName()");

		List<ShowVO> showNameList = alarmService.getShowName(showName);
		System.out.println(showNameList);
		JsonResult jsonResult = new JsonResult();

		jsonResult.success(showNameList);

		return jsonResult;

	}

	// ------------------ 공연번호로 좌석등급 가져오기
	@ResponseBody
	@RequestMapping(value = "/getShowSeatClass", method = RequestMethod.POST)
	public JsonResult getShowSeatClass(@RequestParam("showSq") int showSq) {
		System.out.println("getShowSeatClass()");

		List<SeatClassVO> seatClassList = alarmService.getSeatClassList(showSq);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(seatClassList);

		return jsonResult;

	}

	// ------------------ 알림신청 취소
	@ResponseBody
	@RequestMapping(value = "/arlarmCance", method = RequestMethod.POST)
	public JsonResult arlarmCance(@RequestParam("transferAlarmSq") int transferAlarmSq) {
		System.out.println("arlarmCance()");

		int result = alarmService.arlarmCance(transferAlarmSq);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(result);

		return jsonResult;

	}

}
