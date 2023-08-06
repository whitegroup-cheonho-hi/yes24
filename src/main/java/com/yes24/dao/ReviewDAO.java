package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.Criteria;
import com.yes24.vo.ReviewVO;
import com.yes24.vo.ShowingVO;

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

	// ------------------- 리뷰등록가능 체크
	public List<ShowingVO> reviewCheck(ReviewVO vo) {
		System.out.println("reviewCheck DAO()");
		System.out.println(vo);

		return sqlSession.selectList("review.reviewCheck", vo);
	}

	// ------------------- 리뷰 삭제
	public int deleteReview(int no) {
		System.out.println("deleteReview DAO()");

		return sqlSession.delete("review.deleteReview", no);
	}
}
