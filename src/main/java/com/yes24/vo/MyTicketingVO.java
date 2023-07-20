package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class MyTicketingVO {

	private int ticketingSq;
	private int ticketSq;
	private String ticketingDate;
	private String showName;
	private String ticketNo;
	private String ticketSeat;
	private String startTime;
	private int ticketSeatPrice;
	private int ticketStat;
	private String ticketActive;
	private int showSq;

	public MyTicketingVO() {
		super();
	}

	public MyTicketingVO(int ticketingSq, int ticketSq, String ticketingDate, String showName, String ticketNo,
			String ticketSeat, String startTime, int ticketSeatPrice, int ticketStat, String ticketActive, int showSq) {
		super();
		this.ticketingSq = ticketingSq;
		this.ticketSq = ticketSq;
		this.ticketingDate = ticketingDate;
		this.showName = showName;
		this.ticketNo = ticketNo;
		this.ticketSeat = ticketSeat;
		this.startTime = startTime;
		this.ticketSeatPrice = ticketSeatPrice;
		this.ticketStat = ticketStat;
		this.ticketActive = ticketActive;
		this.showSq = showSq;
	}

	public int getTicketingSq() {
		return ticketingSq;
	}

	public void setTicketingSq(int ticketingSq) {
		this.ticketingSq = ticketingSq;
	}

	public int getTicketSq() {
		return ticketSq;
	}

	public void setTicketSq(int ticketSq) {
		this.ticketSq = ticketSq;
	}

	public String getTicketingDate() {
		return ticketingDate;
	}

	public void setTicketingDate(String ticketingDate) {
		this.ticketingDate = ticketingDate;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(String ticketNo) {
		this.ticketNo = ticketNo;
	}

	public String getTicketSeat() {
		return ticketSeat;
	}

	public void setTicketSeat(String ticketSeat) {
		this.ticketSeat = ticketSeat;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public int getTicketSeatPrice() {
		return ticketSeatPrice;
	}

	public void setTicketSeatPrice(int ticketSeatPrice) {
		this.ticketSeatPrice = ticketSeatPrice;
	}

	public int getTicketStat() {
		return ticketStat;
	}

	public void setTicketStat(int ticketStat) {
		this.ticketStat = ticketStat;
	}

	public String getTicketActive() {
		return ticketActive;
	}

	public void setTicketActive(String ticketActive) {
		this.ticketActive = ticketActive;
	}

	public int getShowSq() {
		return showSq;
	}

	public void setShowSq(int showSq) {
		this.showSq = showSq;
	}

	@Override
	public String toString() {
		return "MyTicketingVO [ticketingSq=" + ticketingSq + ", ticketSq=" + ticketSq + ", ticketingDate="
				+ ticketingDate + ", showName=" + showName + ", ticketNo=" + ticketNo + ", ticketSeat=" + ticketSeat
				+ ", startTime=" + startTime + ", ticketSeatPrice=" + ticketSeatPrice + ", ticketStat=" + ticketStat
				+ ", ticketActive=" + ticketActive + ", showSq=" + showSq + "]";
	}

}
