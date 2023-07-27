package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class NotificationVO {

	private int notificationSq;
	private int transferAlarmSq;	
	private String recipients;
	private String recipientsTitle;
	private String recipientsContent;
	private String recipientsRegDate;

	public NotificationVO() {
		super();
	}

	public NotificationVO(int notificationSq, int transferAlarmSq, String recipients, String recipientsTitle,
			String recipientsContent, String recipientsRegDate) {
		super();
		this.notificationSq = notificationSq;
		this.transferAlarmSq = transferAlarmSq;
		this.recipients = recipients;
		this.recipientsTitle = recipientsTitle;
		this.recipientsContent = recipientsContent;
		this.recipientsRegDate = recipientsRegDate;
	}

	public int getNotificationSq() {
		return notificationSq;
	}

	public void setNotificationSq(int notificationSq) {
		this.notificationSq = notificationSq;
	}

	public int getTransferAlarmSq() {
		return transferAlarmSq;
	}

	public void setTransferAlarmSq(int transferAlarmSq) {
		this.transferAlarmSq = transferAlarmSq;
	}

	public String getRecipients() {
		return recipients;
	}

	public void setRecipients(String recipients) {
		this.recipients = recipients;
	}

	public String getRecipientsTitle() {
		return recipientsTitle;
	}

	public void setRecipientsTitle(String recipientsTitle) {
		this.recipientsTitle = recipientsTitle;
	}

	public String getRecipientsContent() {
		return recipientsContent;
	}

	public void setRecipientsContent(String recipientsContent) {
		this.recipientsContent = recipientsContent;
	}

	public String getRecipientsRegDate() {
		return recipientsRegDate;
	}

	public void setRecipientsRegDate(String recipientsRegDate) {
		this.recipientsRegDate = recipientsRegDate;
	}

	@Override
	public String toString() {
		return "NotificationVO [notificationSq=" + notificationSq + ", transferAlarmSq=" + transferAlarmSq
				+ ", recipients=" + recipients + ", recipientsTitle=" + recipientsTitle + ", recipientsContent="
				+ recipientsContent + ", recipientsRegDate=" + recipientsRegDate + "]";
	}

	

}
