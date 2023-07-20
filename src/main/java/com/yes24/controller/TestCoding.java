package com.yes24.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;

public class TestCoding {

	private static final char[] CHARACTERS = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D',
			'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y',
			'Z' };
	private static final int TICKET_NUMBER_LENGTH = 6;

	public static String generateTicketNumber() {
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		LocalDate today = LocalDate.now();

		// 날짜를 원하는 형식으로 포맷팅
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedDate = today.format(formatter);
		String dateWithoutDash = formattedDate.replace("-", "");
		
		sb.append(dateWithoutDash);
		sb.append("A1");		
		for (int i = 0; i < TICKET_NUMBER_LENGTH; i++) {
			int index = random.nextInt(CHARACTERS.length);

			sb.append(CHARACTERS[index]);
		}

		return sb.toString();
	}

	public static void main(String[] args) {
		String ticketNumber = generateTicketNumber();
		System.out.println("Generated Ticket Number: " + ticketNumber);
	}
}
