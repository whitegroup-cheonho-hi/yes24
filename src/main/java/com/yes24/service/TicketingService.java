package com.yes24.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.TicketingDAO;
import com.yes24.vo.SaveTicketVO;
import com.yes24.vo.TicketVO;
import com.yes24.vo.TicketingVO;
import com.yes24.vo.UserVO;

@Service
public class TicketingService {

	private final char[] CHARACTERS = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
			'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
	private final int TICKET_NUMBER_LENGTH = 6;

	@Autowired
	private TicketingDAO ticketingDAO;

	// -------------- 예매등록
	public int insertTicketing(int no) {
		System.out.println("insertTicketing Service()");

		TicketingVO vo = new TicketingVO();

		vo.setUserSq(no);

		ticketingDAO.insertTicketing(vo);

		return vo.getTicketingSq();
	}

	// -------------- 예매등록
	public int deleteTicketing(UserVO vo) {
		System.out.println("deleteTicketing Service()");

		return ticketingDAO.deleteTicketing(vo);

	}

	// --------------- 티켓 등록
	public int insertTicket(SaveTicketVO vo) {
		System.out.println("insertTicket Service");

		for (int i = 0; i < vo.getSeatNo().size(); i++) {

			TicketVO ticket = new TicketVO();
			String s = generateTicketNumber(vo.getSeatNo().get(i));
			//ticket.set
			System.out.println(s);
			
		}

		return 0;
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
