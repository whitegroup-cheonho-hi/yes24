package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.RemainingSeatsVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowingVO;

@Repository
public class ShowingDAO {

	@Autowired
	private SqlSession sqlSession;

	// 공연번호 날짜로 회차정보 가지고오기
	public List<ShowingVO> getShowing(ShowingVO vo) {
		System.out.println("getShowing DAO()");

		return sqlSession.selectList("showing.getShowing", vo);
	}

	// 잔여좌석 가지고오기
	public List<RemainingSeatsVO> getRemainingSeats(ShowingVO vo) {
		System.out.println("getRemainingSeats DAO()");

		return sqlSession.selectList("showing.getRemainingSeats", vo);
	}

	// 화차 날짜 리스트 가지고오기
	public List<ShowingVO> getShowingDateList(int no) {
		System.out.println("getShowingDateList DAO()");

		return sqlSession.selectList("showing.getShowingDateList", no);
	}

	// 날짜로 화차 리스트 가지고오기
	public List<ShowingVO> getShowingList(ShowingVO vo) {
		System.out.println("getShowingList DAO()");

		return sqlSession.selectList("showing.getShowingListDate", vo);
	}

	// 화차 리스트 가지고오기
	public List<ShowingVO> getShowingList(int no) {
		System.out.println("getShowingList DAO()");

		return sqlSession.selectList("showing.getShowingList", no);
	}

	// 공연 좌석 가져오기
	public List<SeatClassVO> getShowSeats(int no) {
		System.out.println("getShowSeats DAO()");

		return sqlSession.selectList("showing.getShowSeats", no);
	}

}
