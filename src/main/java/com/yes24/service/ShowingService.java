package com.yes24.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.ConcertHallDAO;
import com.yes24.dao.ShowDAO;
import com.yes24.dao.ShowingDAO;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.RemainingSeatsVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingSeatVO;
import com.yes24.vo.ShowingVO;

@Service
public class ShowingService {

	@Autowired
	private ShowingDAO showingDAO;
	@Autowired
	private ShowDAO showDAO;
	@Autowired
	private ConcertHallDAO concertHallDAO;

	// 공연번호 날짜로 회차정보 가지고오기
	public List<ShowingVO> getShowing(ShowingVO vo) {
		System.out.println("getShowing Service()");

		return showingDAO.getShowing(vo);
	}

	// 잔여좌석 가지고오기
	public List<RemainingSeatsVO> getRemainingSeats(ShowingVO vo) {
		System.out.println("getRemainingSeats Service()");

		return showingDAO.getRemainingSeats(vo);
	}

	// 화차날짜 리스트 가지고오기
	public Map<String, Object> getShowingDateList(int no) {
		System.out.println("getShowingDateList Service()");

		Map<String, Object> map = new HashMap<>();
		// 회차정보가져오기
		List<ShowingVO> showingList = showingDAO.getShowingDateList(no);
		// 공연정보 가져오기
		ShowVO showVO = showDAO.getShow(no);
		// 공연장 정보 가져오기
		ConcertHallVO concertHallVO = concertHallDAO.getConcertHall(showVO.getConcertHallSq());

		map.put("concertHall", concertHallVO);
		map.put("showingList", showingList);
		map.put("show", showVO);

		return map;
	}

	// 날짜로 리스트 가지고오기
	public List<ShowingVO> getShowingList(ShowingVO vo) {
		System.out.println("getShowingList Service()");

		return showingDAO.getShowingList(vo);
	}

	// 화차 리스트 가지고오기
	public List<ShowingVO> getShowingList(int no) {
		System.out.println("getShowingList Service()");

		return showingDAO.getShowingList(no);
	}

	// 공연 좌석 가져오기
	public Map<String, Object> getShowSeats(ShowingVO vo) {
		System.out.println("getShowSeats Service()");
		Map<String, Object> map = new HashMap<>();

		List<SeatClassVO> seatClassList = showingDAO.getShowSeats(vo.getShowSq());
		List<ShowingSeatVO> showingSeatList = showingDAO.getShowingSeats(vo.getShowingSq());
		// 잔여좌석
		map.put("seatClassList", seatClassList);
		// 예매된 좌석
		map.put("showingSeatList", showingSeatList);

		return map;
	}

	// ----------------------------------------------------------------------------------------

	public ShowVO getShow2(int no) {
		System.out.println("getShow Service");

		return showDAO.getShow2(no);
	}

	// 회차 입력
	public int insertShowing(ShowingVO vo) {
		System.out.println("insertShowing Service()");

		return showingDAO.insertShowing(vo);
	}

	// 회차 삭제
	public int deleteShowing(String showingSq) {
		System.out.println("deleteShowing Service()");

		return showingDAO.deleteShowing(showingSq);
	}

	// 월별 공연일정
	public List<String> getShowingDay(int showSq) {
		System.out.println("getShowingDay Service()");

		List<String> list = showingDAO.getShowingDay(showSq);
		return list;
	}

	// ----------------------------------------------------------------------------------------

}
