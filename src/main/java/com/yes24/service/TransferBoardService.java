package com.yes24.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.AlarmDAO;
import com.yes24.dao.ConcertHallDAO;
import com.yes24.dao.ShowDAO;
import com.yes24.dao.ShowingDAO;
import com.yes24.dao.TicketDAO;
import com.yes24.dao.TransferBoardDAO;
import com.yes24.dto.PageMakerDTO;
import com.yes24.vo.AlarmVO;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.Criteria;
import com.yes24.vo.MessageVO;
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
	@Autowired
	private AlarmDAO alarmDAO;

	// ------------------- 양도게시판 등록
	public int insertTransferboard(TransferBoardVO vo) {
		System.out.println("insertTransferboard Service()");
		
		// 티켓 상태 변경 4
		ticketDAO.updateTicket(vo.getTicketSq());
		// 양도게시판 등록
		int result = transferBoardDAO.insertTransferboard(vo);
		// 비교할 티켓 정보들 가져오기
		AlarmVO alarmVO = alarmDAO.getAlarm(vo.getTicketSq());
		
		// 티켓정보로 양도알림테이블에서 비교 후 값 가져오기
		List<AlarmVO> alarmList = alarmDAO.alarmCheck(alarmVO);
		
		System.out.println(alarmList);
		
		StringBuffer sb = new StringBuffer();
		sb.append("<a href=\'/yes24/transferTicket/transferTicketDetail/");
		sb.append(vo.getTransferBoardSq());
		sb.append("'>게시글보기</a>");
		
		// 조건에 맞는 등록된 양도알림신청이 있으면
		if (alarmList != null) {

			for (AlarmVO a : alarmList) {
				
				MessageVO message = new MessageVO();
				
				message.setUserSq(a.getUserSq());
				message.setTransferBoardSq(vo.getTransferBoardSq());
				message.setShowName(a.getShowName());
				message.setContent(sb.toString());
				// 알림함등록
				alarmDAO.insertNotification(message);
				
			}
		}

		return result;
	}

	// -------------------- 양도 게시글 삭제
	public int deleteTransferboard(MyTicketingVO vo) {
		System.out.println("deleteTransferboard Service()");

		// 티켓 상태 변경
		ticketDAO.cancelTransferTicket(vo.getTicketSq());
		
		// 양도취소하면 알림도 제거
		alarmDAO.deleteNotification(vo.getTransferBoardSq());

		// 양도게시글 삭제
		return transferBoardDAO.deleteTransferboard(vo.getTransferBoardSq());
	}

	// -------------------- 양도게시글 리스트 가져오기
	public Map<String, Object> getTransferboardList(Criteria cri) {
		System.out.println("getTransferboardList Service()");

		Map<String, Object> map = new HashMap<>();

		int total = transferBoardDAO.getTotal(cri);
		// 양도 게시판 리스트
		List<TransferBoardVO> transferBoardList = transferBoardDAO.getTransferboardList(cri);
		// 임박 5개 가져오기
		List<TransferBoardVO> imminentShowing = transferBoardDAO.getImminentShowing();

		PageMakerDTO pageMaker = new PageMakerDTO(total, cri);

		map.put("transferBoardList", transferBoardList);
		map.put("imminentShowing", imminentShowing);
		map.put("pageMaker", pageMaker);

		return map;
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

	// -------------- 양도 디테일 좌석그리기
	public List<SeatClassVO> drawingSeat(int no) {
		System.out.println("drawingSeat Service()");

		// 공연좌석
		return showingDAO.getShowSeats(no);
	}
}
