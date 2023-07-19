package com.yes24.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.service.ShowingService;
import com.yes24.vo.JsonResult;
import com.yes24.vo.RemainingSeatsVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowingVO;

@Controller
@RequestMapping("/showing")
public class ShowingController {

	@Autowired
	private ShowingService showingService;

	// ---------------------- 공연회차 가져오기
	@ResponseBody
	@RequestMapping(value = "/getShowing", method = RequestMethod.POST)
	public JsonResult getShowing(@ModelAttribute ShowingVO vo) {
		System.out.println("getShowing()");

		System.out.println(vo);

		List<ShowingVO> showingList = showingService.getShowing(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(showingList);

		return jsonResult;

	}

	// ---------------------- 잔여좌석 가져오기
	@ResponseBody
	@RequestMapping(value = "/remainingSeats", method = RequestMethod.POST)
	public JsonResult getRemainingSeats(@ModelAttribute ShowingVO vo) {
		System.out.println("getRemainingSeats()");

		List<RemainingSeatsVO> remainingSeatsList = showingService.getRemainingSeats(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(remainingSeatsList);

		return jsonResult;

	}

	// ---------------------- 공연회차리시트 가져오기
	@ResponseBody
	@RequestMapping(value = "/getShowingList", method = RequestMethod.POST)
	public JsonResult getShowingList(@ModelAttribute ShowingVO vo) {
		System.out.println("getShowingList()");

		List<ShowingVO> showingList = showingService.getShowingList(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(showingList);

		return jsonResult;

	}

	// ---------------------- 공연좌석리시트 가져오기
	@ResponseBody
	@RequestMapping(value = "/getShowSeatList", method = RequestMethod.POST)
	public JsonResult getShowSeatList(@ModelAttribute ShowingVO vo) {
		System.out.println("getShowSeatList()");
		
		Map<String, Object> map = showingService.getShowSeats(vo);
		
		JsonResult jsonResult = new JsonResult();
		
		jsonResult.success(map);
		
		return jsonResult;

	}

}
