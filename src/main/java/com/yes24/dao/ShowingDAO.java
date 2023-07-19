package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.RemainingSeatsVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowingSeatVO;
import com.yes24.vo.ShowingVO;

@Repository
public class ShowingDAO {

	@Autowired
	private SqlSession sqlSession;

	// 공연번호 날짜로 회차정보 가지고오기 -- 공연 디테일페이지에서 캘린더에 그릴때
	public List<ShowingVO> getShowing(ShowingVO vo) {
		System.out.println("getShowing DAO()");

		return sqlSession.selectList("showing.getShowings", vo);
	}

	// 회차 정보 가져오기
	public ShowingVO getShowing(int no) {
		System.out.println("getShowing DAO()");

		return sqlSession.selectOne("showing.getShowing", no);
	}

	// 회차좌석에 예매된 자석 가져오기 -- 예매된 좌석 비활성화 시키기위해
	public List<ShowingSeatVO> getShowingSeats(int no) {
		System.out.println("getShowingSeats DAO()");

		return sqlSession.selectList("showing.getShowingSeats", no);
	}

	// 잔여좌석 갯수 가지고오기 -- 클래스마다 좌석 갯수 보여주기
	public List<RemainingSeatsVO> getRemainingSeats(ShowingVO vo) {
		System.out.println("getRemainingSeats DAO()");

		return sqlSession.selectList("showing.getRemainingSeats", vo);
	}

	// 공연 번호로 회차 날짜 리스트 가지고오기 -- 예매 2페이지에 날짜선택 옵션에 사용
	public List<ShowingVO> getShowingDateList(int no) {
		System.out.println("getShowingDateList DAO()");

		return sqlSession.selectList("showing.getShowingDateList", no);
	}

	// 날짜로 회차 리스트 가지고오기 -- 예매 2페이지에 회차선택 옵션에 사용
	public List<ShowingVO> getShowingList(ShowingVO vo) {
		System.out.println("getShowingList DAO()");

		return sqlSession.selectList("showing.getShowingListDate", vo);
	}

	// 회차 리스트 가지고오기 -- 공연번호로 회차리스트 가지고오기
	public List<ShowingVO> getShowingList(int no) {
		System.out.println("getShowingList DAO()");

		return sqlSession.selectList("showing.getShowingList", no);
	}

	// 공연 좌석 가져오기 -- 공연번호로 공연의 좌석 정보 가지고오기 (ex 등급, 좌석번호
	public List<SeatClassVO> getShowSeats(int no) {
		System.out.println("getShowSeats DAO()");

		return sqlSession.selectList("showing.getShowSeats", no);
	}

}
