package com.yes24.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ShowVO {

	private int showSp;
	private String mainImage;
	private String subImage;	
	private Date startDate;
	private Date endDate;
	private Date reservationDate;
	private String showName;
	private String cast;
	private String director;
	private String showTime;
	private String viewingAge;
	private String showContent;
	private int category;
	private int showStat;
	//공연장
	private int concertHallSq;
	//상세이미지 배열
	private int[] detailedImageSq; 
	private String[] detailedImage;
	//좌석클래스 배열
	private int[] seatClassSq;
	private String[] seatClass;
	private int[] seatPrice;
	
	
}
