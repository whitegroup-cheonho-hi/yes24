package com.yes24.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class TransferAlarmVO {

	private int transferAlarmSq;
	private String showName;
	private Date startDate;
	private Date endDate;
	private String seat;
	private int price;
	private String transferAlarmStat;
	//회원
	private int userSq;
}
