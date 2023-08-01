package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class UserTicketingVO {
	private String userId;
	private String userName;
	private String gender;
	private String showName;
	private int totalPrice;
	private String ticketSeat;
	private String showingDate;
	private String concertHallName;
	
	public UserTicketingVO() {
		super();
	}

	public UserTicketingVO(String userId, String userName, String gender, String showName, int totalPrice,
			String ticketSeat, String showingDate, String concertHallName) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.gender = gender;
		this.showName = showName;
		this.totalPrice = totalPrice;
		this.ticketSeat = ticketSeat;
		this.showingDate = showingDate;
		this.concertHallName = concertHallName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getTicketSeat() {
		return ticketSeat;
	}

	public void setTicketSeat(String ticketSeat) {
		this.ticketSeat = ticketSeat;
	}

	public String getShowingDate() {
		return showingDate;
	}

	public void setShowingDate(String showingDate) {
		this.showingDate = showingDate;
	}

	public String getConcertHallName() {
		return concertHallName;
	}

	public void setConcertHallName(String concertHallName) {
		this.concertHallName = concertHallName;
	}

	@Override
	public String toString() {
		return "UserTicketingVO [userId=" + userId + ", userName=" + userName + ", gender=" + gender + ", showName="
				+ showName + ", totalPrice=" + totalPrice + ", ticketSeat=" + ticketSeat + ", showingDate="
				+ showingDate + ", concertHallName=" + concertHallName + "]";
	}

}
