package com.yes24.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class QnAVO {

	private int qnaSq;
	private String qnaTitle;
	private String qnaContent;
	private int qnaSecret;
	private Date qnaRegDate;
	private String qnaStat;
	//회원
	private int userSq;
}
