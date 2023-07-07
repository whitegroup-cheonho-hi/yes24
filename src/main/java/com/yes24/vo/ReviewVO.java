package com.yes24.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class ReviewVO {

	private int reviewSq;
	private String reviewContent;
	private Date reviewRegDate;
	private int grade;
	//회원
	private int userSq;
	//공연
	private int showSq;
}
