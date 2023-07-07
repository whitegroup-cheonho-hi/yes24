package com.yes24.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class NotificationVO {

	private int notificationSq;
	private String recipients;
	private String recipientsTitle;
	private String recipientsContent;
	private Date recipientsRegDate;
	

}
