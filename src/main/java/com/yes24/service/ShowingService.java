package com.yes24.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.ShowDAO;
import com.yes24.dao.ShowingDAO;
import com.yes24.vo.RemainingSeatsVO;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;

@Service
public class ShowingService {

	@Autowired
	private ShowingDAO showingDAO;
	@Autowired
	private ShowDAO showDAO;

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
		
		List<ShowingVO>	showingList = showingDAO.getShowingDateList(no);
		
		ShowVO showVO = showDAO.getShow(no);
				
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
}
