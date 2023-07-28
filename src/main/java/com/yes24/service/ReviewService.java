package com.yes24.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.ReviewDAO;
import com.yes24.vo.ReviewVO;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;

	// ------------------- 리뷰 등록
	public ReviewVO insertReview(ReviewVO vo) {
		System.out.println("insertReview Service()");

		int result = reviewDAO.insertReview(vo);

		System.out.println("리뷰시퀀스"+vo.getReviewSq());
		
		ReviewVO reviewVO = reviewDAO.getReview(vo.getReviewSq());
		

		return reviewVO;
	}
}
