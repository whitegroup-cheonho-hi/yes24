package com.yes24.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class ShowingVO {
	
	private int showingSq;
	private Date showingDate;
	private Date startTime;
	private Date endTime;
	private String showInformation;
	private String showingStat;
	//공연
	private int showSq;
	//회차좌석 배열
	private int[] showingSeatSq;
	private String[] showingSeatNO;
	private int[] showingSeatStat;
	
	

}
