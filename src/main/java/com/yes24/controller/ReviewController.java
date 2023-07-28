package com.yes24.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yes24.service.ReviewService;
import com.yes24.vo.JsonResult;
import com.yes24.vo.ReviewVO;
import com.yes24.vo.UserVO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@ResponseBody
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	public JsonResult insertReview(@ModelAttribute ReviewVO vo, HttpSession session) {
		System.out.println("insertReview()");

		UserVO userVO = (UserVO) session.getAttribute("authUser");

		vo.setUserSq(userVO.getUserSq());

		ReviewVO reviewVO = reviewService.insertReview(vo);

		System.out.println(reviewVO);

		JsonResult jsonResult = new JsonResult();

		jsonResult.success(reviewVO);

		return jsonResult;
	}

}
