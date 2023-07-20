package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class TicketVO {

	private int ticketSq;
	private String ticketNo;
	private String ticketSeat;
	private int ticketSeatPrice;
	private int ticketStat;
	private String ticketActive;
	// 회차
	private int showingSq;
	// 예매
	private int ticketingSq;

	public TicketVO() {
		super();
	}

	public TicketVO(int ticketSq, String ticketNo, String ticketSeat, int ticketSeatPrice, int ticketStat,
			String ticketActive, int showingSq, int ticketingSq) {
		super();
		this.ticketSq = ticketSq;
		this.ticketNo = ticketNo;
		this.ticketSeat = ticketSeat;
		this.ticketSeatPrice = ticketSeatPrice;
		this.ticketStat = ticketStat;
		this.ticketActive = ticketActive;
		this.showingSq = showingSq;
		this.ticketingSq = ticketingSq;
	}

	public int getTicketSq() {
		return ticketSq;
	}

	public void setTicketSq(int ticketSq) {
		this.ticketSq = ticketSq;
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

	public int getShowingSq() {
		return showingSq;
	}

	public void setShowingSq(int showingSq) {
		this.showingSq = showingSq;
	}

	public int getTicketingSq() {
		return ticketingSq;
	}

	public void setTicketingSq(int ticketingSq) {
		this.ticketingSq = ticketingSq;
	}

	@Override
	public String toString() {
		return "TicketVO [ticketSq=" + ticketSq + ", ticketNo=" + ticketNo + ", ticketSeat=" + ticketSeat
				+ ", ticketSeatPrice=" + ticketSeatPrice + ", ticketStat=" + ticketStat + ", ticketActive="
				+ ticketActive + ", showingSq=" + showingSq + ", ticketingSq=" + ticketingSq + "]";
	}

}
