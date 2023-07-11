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

	// -------------------- 공연장 등록
	public int insertConcertHall(ConcertHallVO vo) {
		System.out.println("insertConcertHall DAO");
		List<String> seatList = new ArrayList<>();
		Map<String, Object> seat = new HashMap<>();
		// 아스키코드
		int A = 65;
		int height = vo.getConcertHallHeight();
		int width = vo.getConcertHallWidth();

		int result = concertHallDAO.insertConcertHall(vo);

		// 입력받은 열과행값으로 좌석번호 만들기
		for (int i = A; i < (height + A); i++) {
			for (int j = 1; j <= width; j++) {
				String seatNo = (char) i + String.valueOf(j);
				seatList.add(seatNo);
			}
		}

		for (int i = 0; i < (height * width); i++) {

			seat.put("seatNo", seatList.get(i));
			seat.put("concerthallsq", vo.getConcertHallSq());

			concertHallDAO.insertConcertHallSeat(seat);
		}

		return 0;
	}

}
