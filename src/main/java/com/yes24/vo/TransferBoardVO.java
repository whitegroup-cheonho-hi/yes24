package com.yes24.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class TransferBoardVO {

	private int transferBoardSq;
	private int hopePrice;
	private String transferStat;
	private String transferBoardContent;
	private Date transferBoardRegDate;
	private Date transferDate;
	//회원
	private int buyUserSq;
	private int sellUserSq;
	//티켓
	private int ticketSq;
	
}
