package com.yes24.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.ShowingDAO;
import com.yes24.vo.RemainingSeatsVO;
import com.yes24.vo.ShowingVO;

@Service
public class ShowingService {

	@Autowired
	private ShowingDAO showingDAO;

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
}
