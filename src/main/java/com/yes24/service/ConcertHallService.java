package com.yes24.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.ConcertHallDAO;
import com.yes24.vo.ConcertHallVO;

@Service
public class ConcertHallService {

	@Autowired
	private ConcertHallDAO concertHallDAO;

	// -------------------- 공연장 등록 & 좌석등록
	public int insertConcertHall(ConcertHallVO vo) {
		System.out.println("insertConcertHall Service");

		Map<String, Object> seat = new HashMap<>();
		int height = vo.getConcertHallHeight();
		int width = vo.getConcertHallWidth();

		int result = concertHallDAO.insertConcertHall(vo);
		
		List<String> seatList = seat(vo, height, width);

		for (int i = 0; i < (height * width); i++) {

			seat.put("seatNo", seatList.get(i));
			seat.put("concerthallsq", vo.getConcertHallSq());

			concertHallDAO.insertConcertHallSeat(seat);
		}

		return result;
	}

	// -------------------- 공연장 정보가져오기
	public ConcertHallVO getConcertHall(int no) {
		System.out.println("getConcertHall Service()");

		return concertHallDAO.getConcertHall(no);
	}

	// -------------------- 공연장 리스트가져오기
	public List<ConcertHallVO> getConcertHallList() {
		System.out.println("getConcertHallList Service()");

		return concertHallDAO.getConcertHallList();
	}

	// -------------------- 공연장정보 업데이트
	public int updateConcertHall(ConcertHallVO vo) {
		System.out.println("updateConcertHall Service()");

		Map<String, Object> seat = new HashMap<>();
		int height = vo.getConcertHallHeight();
		int width = vo.getConcertHallWidth();
		
		ConcertHallVO concertHallVO = concertHallDAO.getConcertHall(vo.getConcertHallSq());

		int result = concertHallDAO.updateConcertHall(vo);
		// 저장되어있는 공연장정보 가져오기
				
		// width or height 값이 바뀌지 않았을때
		if (concertHallVO.getConcertHallHeight() != height || concertHallVO.getConcertHallWidth() != width) {
			//기존 좌석을 삭제
			concertHallDAO.deleteConcertHallSeat(vo.getConcertHallSq());

			List<String> seatList = seat(vo, height, width);

			for (int i = 0; i < (height * width); i++) {

				seat.put("seatNo", seatList.get(i));
				seat.put("concerthallsq", vo.getConcertHallSq());

				concertHallDAO.insertConcertHallSeat(seat);
			}
		}

		return result;
	}

	// 좌석생성 함수
	public List<String> seat(ConcertHallVO vo, int height, int width) {
		List<String> seatList = new ArrayList<>();
		// 아스키코드
		int A = 65;
		// 입력받은 열과행값으로 좌석번호 만들기
		for (int i = A; i < (height + A); i++) {
			for (int j = 1; j <= width; j++) {
				String seatNo = (char) i + String.valueOf(j);
				seatList.add(seatNo);
			}
		}
		return seatList;
	}

}
