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

import com.yes24.service.ReviewService;
import com.yes24.vo.JsonResult;
import com.yes24.vo.ReviewVO;
import com.yes24.vo.ShowingVO;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// ----------------- 관람공연 체크
	@ResponseBody
	@RequestMapping(value = "/viewingCheck", method = RequestMethod.POST)
	public JsonResult viewingCheck(@ModelAttribute ReviewVO vo,HttpSession session) {
		System.out.println("viewingCheck()");

		UserVO userVO = (UserVO) session.getAttribute("authUser");

		vo.setUserSq(userVO.getUserSq());
		
		List<ShowingVO> showingSqList = reviewService.reviewCheck(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(showingSqList);

		return jsonResult;
	}

	// ----------------- 리뷰등록
	@ResponseBody
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	public JsonResult insertReview(@ModelAttribute ReviewVO vo, HttpSession session) {
		System.out.println("insertReview()");
		
		UserVO userVO = (UserVO) session.getAttribute("authUser");

		vo.setUserSq(userVO.getUserSq());

		ReviewVO reviewVO = reviewService.insertReview(vo);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(reviewVO);

		return jsonResult;
	}

}
