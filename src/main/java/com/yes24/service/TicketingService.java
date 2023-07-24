package com.yes24.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.TicketDAO;
import com.yes24.dao.TicketingDAO;
import com.yes24.dao.TransferBoardDAO;
import com.yes24.vo.SaveTicketVO;
import com.yes24.vo.ShowingSeatVO;
import com.yes24.vo.TicketVO;
import com.yes24.vo.TicketingVO;
import com.yes24.vo.TransferBoardVO;
import com.yes24.vo.UserVO;

@Service
public class TicketingService {

	private final char[] CHARACTERS = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
			'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
	private final int TICKET_NUMBER_LENGTH = 6;

	@Autowired
	private TicketingDAO ticketingDAO;
	@Autowired
	private TicketDAO ticketDAO;
	@Autowired
	private TransferBoardDAO transferBoardDAO;

	// -------------- 예매등록
	public int insertTicketing(int no) {
		System.out.println("insertTicketing Service()");

		TicketingVO vo = new TicketingVO();

		vo.setUserSq(no);

		ticketingDAO.insertTicketing(vo);

		return vo.getTicketingSq();
	}

	// -------------- 예매취소
	public int deleteTicketing(UserVO vo) {
		System.out.println("deleteTicketing Service()");

		return ticketingDAO.deleteTicketing(vo);

	}

	// --------------- 티켓 등록
	public int insertTicket(SaveTicketVO vo) {
		System.out.println("insertTicket Service");

		for (int i = 0; i < vo.getSeatNo().size(); i++) {
			// 티켓 객체 생성
			TicketVO ticket = new TicketVO();
			String s = generateTicketNumber(vo.getSeatNo().get(i));
			ticket.setTicketNo(s);
			ticket.setTicketSeatNo(vo.getSeatNo().get(i));
			ticket.setTicketSeatPrice(vo.getSeatPrice().get(i));
			ticket.setShowingSq(vo.getShowingSq());
			ticket.setTicketingSq(vo.getTicketingSq());
			// 반복으로 티켓 생성
			ticketingDAO.insertTicket(ticket);

			// 회차좌석 객체 생성
			ShowingSeatVO showingSeatVO = new ShowingSeatVO();
			showingSeatVO.setShowingSq(vo.getShowingSq());
			showingSeatVO.setSeatClass(vo.getSeatClass().get(i));
			showingSeatVO.setShowingSeatNo(vo.getSeatNo().get(i));
			// 좌석 등급명으로 좌석등급 시퀀스 넣기위한 코드
			showingSeatVO.setSeatClassSq(vo.getShowSq());

			// 반복으로 회차좌석 등록
			ticketingDAO.insertShowingSeat(showingSeatVO);

		}

		return 0;
	}

	// --------------- 양도표 구매
	public int buyTransferTicket(TransferBoardVO vo) {
		System.out.println("buyTransferTicket Service()");
		System.out.println(vo);
				
		// 기존 티켓 상태변경
		ticketDAO.buyTransferTicket(vo.getTicketSq());
		
		TicketingVO ticketingVO = new TicketingVO();
		// 예매 생성
		ticketingVO.setUserSq(vo.getBuyUserSq());		
		ticketingDAO.insertTicketing(ticketingVO);
		
		// 새티켓 등록
		TicketVO ticket = new TicketVO();
		String s = generateTicketNumber(vo.getTicketSeat());		
		ticket.setTicketNo(s);
		ticket.setTicketSeatNo(vo.getTicketSeat());
		ticket.setTicketingSq(ticketingVO.getTicketingSq());
		ticket.setShowingSq(vo.getTicketSq());		
		
		ticketingDAO.buyTransferTicket(ticket);
		
		// 양도 게시판 상태 변경
		return transferBoardDAO.updateTransferboard(vo);
	}

	// --------------- 티켓번호 난수 생성
	public String generateTicketNumber(String seatNo) {
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		LocalDate today = LocalDate.now();

		// 날짜를 원하는 형식으로 포맷팅
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedDate = today.format(formatter);
		String dateWithoutDash = formattedDate.replace("-", "");

		sb.append(dateWithoutDash);
		sb.append(seatNo);
		for (int i = 0; i < TICKET_NUMBER_LENGTH; i++) {
			int index = random.nextInt(CHARACTERS.length);

			sb.append(CHARACTERS[index]);
		}

		return sb.toString();
	}

}
