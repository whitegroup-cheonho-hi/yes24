package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.Criteria;
import com.yes24.vo.ReviewVO;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;

	// ------------------- 리뷰 등록
	public int insertReview(ReviewVO vo) {
		System.out.println("insertReview DAO()");

		return sqlSession.insert("review.insertReview", vo);
	}

	// ------------------- 리뷰 등록
	public ReviewVO getReview(int no) {
		System.out.println("getReview DAO()");

		return sqlSession.selectOne("review.getReview", no);
	}

	// ------------------- 리뷰 등록
	public List<ReviewVO> getReviewList(Criteria cri) {
		System.out.println("getReview DAO()");

		return sqlSession.selectList("review.getReviewList", cri);
	}

	// ------------------- 리뷰 등록
	public int getTotal(int no) {
		System.out.println("getTotal DAO()");

		return sqlSession.selectOne("review.getTotal", no);
	}
}
