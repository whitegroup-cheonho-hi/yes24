package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class TicketingVO {

	private int ticketingSq;
	private String ticketingDate;
	private int userSq;
	public TicketingVO() {
		super();
	}
	public TicketingVO(int ticketingSq, String ticketingDate, int userSq) {
		super();
		this.ticketingSq = ticketingSq;
		this.ticketingDate = ticketingDate;
		this.userSq = userSq;
	}
	public int getTicketingSq() {
		return ticketingSq;
	}
	public void setTicketingSq(int ticketingSq) {
		this.ticketingSq = ticketingSq;
	}
	public String getTicketingDate() {
		return ticketingDate;
	}
	public void setTicketingDate(String ticketingDate) {
		this.ticketingDate = ticketingDate;
	}
	public int getUserSq() {
		return userSq;
	}
	public void setUserSq(int userSq) {
		this.userSq = userSq;
	}
	@Override
	public String toString() {
		return "TicketingVO [ticketingSq=" + ticketingSq + ", ticketingDate=" + ticketingDate + ", userSq=" + userSq
				+ "]";
	}
	
	
}
