package com.yes24.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.ConcertHallDAO;
import com.yes24.dao.ShowDAO;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.SeatVO;
import com.yes24.vo.ShowVO;

@Service
public class ConcertHallService {

	@Autowired
	private ConcertHallDAO concertHallDAO;
	@Autowired
	private ShowDAO showDAO;

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
		int result = 0;
		ConcertHallVO concertHallVO = concertHallDAO.getConcertHall(vo.getConcertHallSq());

		concertHallDAO.updateConcertHall(vo);
		// 저장되어있는 공연장정보 가져오기

		// width or height 값이 바뀌지 않았을때
		if (concertHallVO.getConcertHallHeight() != height || concertHallVO.getConcertHallWidth() != width) {

			List<SeatVO> deleteSeatList = new ArrayList<>();

			// 공연장 시퀀스로 공연장 좌석 시퀀스가져오기
			deleteSeatList = concertHallDAO.getConcertHallSeatList(vo.getConcertHallSq());
			// 삭제된 공연좌석 카운트
			int cnt = 0;
			// 공연좌석 삭제
			for (SeatVO seatVO : deleteSeatList) {

				cnt += concertHallDAO.deleteShowSeat(seatVO.getSeatSq());
			}
			// 공연좌석이 삭제가 되면
			if (cnt > 0) {
				//공연시퀀스 가지고와서
				ShowVO showVO = showDAO.getShowSq(vo.getConcertHallSq());
				// 리턴값으로 넣어준다
				result = showVO.getshowSq();
			}

			// 기존 좌석을 삭제
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
