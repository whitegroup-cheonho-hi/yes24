package com.yes24.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.ConcertHallDAO;
import com.yes24.dao.ShowDAO;
import com.yes24.dao.ShowingDAO;
import com.yes24.dao.TicketDAO;
import com.yes24.dao.TransferBoardDAO;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.MyTicketingVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowVO;
import com.yes24.vo.TransferBoardVO;

@Service
public class TransferBoardService {

	@Autowired
	private TransferBoardDAO transferBoardDAO;
	@Autowired
	private TicketDAO ticketDAO;
	@Autowired
	private ShowDAO showDAO;
	@Autowired
	private ConcertHallDAO concertHallDAO;
	@Autowired
	private ShowingDAO showingDAO;

	// ------------------- 양도게시판 등록
	public int insertTransferboard(TransferBoardVO vo) {
		System.out.println("insertTransferboard Service()");

		ticketDAO.updateTicket(vo.getTicketSq());

		return transferBoardDAO.insertTransferboard(vo);
	}

	// -------------------- 양도 게시글 삭제
	public int deleteTransferboard(MyTicketingVO vo) {
		System.out.println("deleteTransferboard Service()");

		ticketDAO.cancelTransferTicket(vo.getTicketSq());

		return transferBoardDAO.deleteTransferboard(vo.getTransferBoardSq());
	}

	// -------------------- 양도게시글 리스트 가져오기
	public List<TransferBoardVO> getTransferboardList() {
		System.out.println("getTransferboardList Service()");

		return transferBoardDAO.getTransferboardList();
	}

	// -------------------- 양도게시판 디테일 가져오기
	public Map<String, Object> getTransferboard(int no) {
		System.out.println("getTransferboardList Service()");

		Map<String, Object> map = new HashMap<>();
		List<Integer> seatClassSqList = new ArrayList<>();
		List<String> seatClassList = new ArrayList<>();
		List<Integer> seatPriceSqList = new ArrayList<>();

		// 양도게시글
		TransferBoardVO transferBoardVO = transferBoardDAO.getTransferboard(no);
		// 공연 정보
		ShowVO showVO = showDAO.getShow(transferBoardVO.getShowSq());
		// 공연 좌석
		List<SeatClassVO> showSeatList = showingDAO.getShowSeats(transferBoardVO.getShowSq());
		// 공연장 정보
		ConcertHallVO concertHallVO = concertHallDAO.getConcertHall(showVO.getConcertHallSq());
		// 좌석클레스
		List<SeatClassVO> SeatClassList = showDAO.getSeatClassList(transferBoardVO.getShowSq());
		for (SeatClassVO seatClassSq : SeatClassList) {
			seatClassSqList.add(seatClassSq.getSeatClassSq());
			seatClassList.add(seatClassSq.getSeatClass());
			seatPriceSqList.add(seatClassSq.getSeatPrice());
		}
		showVO.setSeatClassSq(seatClassSqList);
		showVO.setSeatClass(seatClassList);
		showVO.setSeatPrice(seatPriceSqList);

		map.put("transferBoardVO", transferBoardVO);
		map.put("showVO", showVO);
		map.put("concertHallVO", concertHallVO);
		map.put("showSeatList", showSeatList);

		return map;
	}

	public List<SeatClassVO> drawingSeat(int no) {
		System.out.println("drawingSeat Service()");
		
		// 공연좌석
		return showingDAO.getShowSeats(no);
	}
}
