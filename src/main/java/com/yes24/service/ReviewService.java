package com.yes24.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.ReviewDAO;
import com.yes24.vo.ReviewVO;
import com.yes24.vo.ShowingVO;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;

	// ------------------- 리뷰 등록
	public ReviewVO insertReview(ReviewVO vo) {
		System.out.println("insertReview Service()");

		int result = reviewDAO.insertReview(vo);

		ReviewVO reviewVO = reviewDAO.getReview(vo.getReviewSq());

		return reviewVO;
	}

	// ------------------- 리뷰등록가능 체크
	public List<ShowingVO> reviewCheck(ReviewVO vo) {
		System.out.println("reviewCheck Service()");

		return reviewDAO.reviewCheck(vo);
	}

	// ------------------- 리뷰 삭제
	public int deleteReview(int no) {
		System.out.println("deleteReview Service()");

		return reviewDAO.deleteReview(no);
	}
}
