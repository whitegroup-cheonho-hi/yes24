package com.yes24.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class AlarmVO {

	private int transferAlarmSq;
	private int showSq;
	private String showName;
	private String startDate;
	private String endDate;
	private List<String> seatClass;
	private String seatClasss;
	private int price;
	private String transferAlarmStat;
	// 유저
	private int userSq;

	public AlarmVO() {
		super();
	}

	public AlarmVO(int transferAlarmSq, int showSq, String showName, String startDate, String endDate,
			List<String> seatClass, String seatClasss, int price, String transferAlarmStat, int userSq) {
		super();
		this.transferAlarmSq = transferAlarmSq;
		this.showSq = showSq;
		this.showName = showName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.seatClass = seatClass;
		this.seatClasss = seatClasss;
		this.price = price;
		this.transferAlarmStat = transferAlarmStat;
		this.userSq = userSq;
	}

	public int getTransferAlarmSq() {
		return transferAlarmSq;
	}

	public void setTransferAlarmSq(int transferAlarmSq) {
		this.transferAlarmSq = transferAlarmSq;
	}

	public int getShowSq() {
		return showSq;
	}

	public void setShowSq(int showSq) {
		this.showSq = showSq;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public List<String> getSeatClass() {
		return seatClass;
	}

	public void setSeatClass(List<String> seatClass) {
		this.seatClass = seatClass;
	}

	public String getSeatClasss() {
		return seatClasss;
	}

	public void setSeatClasss(String seatClasss) {
		this.seatClasss = seatClasss;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTransferAlarmStat() {
		return transferAlarmStat;
	}

	public void setTransferAlarmStat(String transferAlarmStat) {
		this.transferAlarmStat = transferAlarmStat;
	}

	public int getUserSq() {
		return userSq;
	}

	public void setUserSq(int userSq) {
		this.userSq = userSq;
	}

	@Override
	public String toString() {
		return "AlarmVO [transferAlarmSq=" + transferAlarmSq + ", showSq=" + showSq + ", showName=" + showName
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", seatClass=" + seatClass + ", seatClasss="
				+ seatClasss + ", price=" + price + ", transferAlarmStat=" + transferAlarmStat + ", userSq=" + userSq
				+ "]";
	}

}
