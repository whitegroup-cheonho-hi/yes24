package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class TransferBoardVO {

	private int transferBoardSq;
	private int hopePrice;
	private String transferStat;
	private String transferBoardContent;
	private String transferBoardRegDate;
	private String transferDate;
	// 회원
	private int buyUserSq;
	private int sellUserSq;
	private String sellUser;
	private String buyUser;
	private String userId;
	// 티켓
	private int ticketSq;
	private int ticketSeatPrice;
	private String ticketSeat;
	private String startTime;
	private String seatClass;
	// 공연
	private int showSq;
	private String subImage;
	private String showName;


	public TransferBoardVO() {
		super();
	}
	
	public TransferBoardVO(int transferBoardSq, int hopePrice, String transferStat, String transferBoardContent,
			String transferBoardRegDate, String transferDate, int buyUserSq, int sellUserSq, String sellUser,
			String buyUser, String userId, int ticketSq, int ticketSeatPrice, String ticketSeat, String startTime,
			String seatClass, int showSq, String subImage, String showName) {
		super();
		this.transferBoardSq = transferBoardSq;
		this.hopePrice = hopePrice;
		this.transferStat = transferStat;
		this.transferBoardContent = transferBoardContent;
		this.transferBoardRegDate = transferBoardRegDate;
		this.transferDate = transferDate;
		this.buyUserSq = buyUserSq;
		this.sellUserSq = sellUserSq;
		this.sellUser = sellUser;
		this.buyUser = buyUser;
		this.userId = userId;
		this.ticketSq = ticketSq;
		this.ticketSeatPrice = ticketSeatPrice;
		this.ticketSeat = ticketSeat;
		this.startTime = startTime;
		this.seatClass = seatClass;
		this.showSq = showSq;
		this.subImage = subImage;
		this.showName = showName;
	}

	public String getSeatClass() {
		return seatClass;
	}

	public void setSeatClass(String seatClass) {
		this.seatClass = seatClass;
	}

	public int getTransferBoardSq() {
		return transferBoardSq;
	}

	public void setTransferBoardSq(int transferBoardSq) {
		this.transferBoardSq = transferBoardSq;
	}

	public int getHopePrice() {
		return hopePrice;
	}

	public void setHopePrice(int hopePrice) {
		this.hopePrice = hopePrice;
	}

	public String getTransferStat() {
		return transferStat;
	}

	public void setTransferStat(String transferStat) {
		this.transferStat = transferStat;
	}

	public String getTransferBoardContent() {
		return transferBoardContent;
	}

	public void setTransferBoardContent(String transferBoardContent) {
		this.transferBoardContent = transferBoardContent;
	}

	public String getTransferBoardRegDate() {
		return transferBoardRegDate;
	}

	public void setTransferBoardRegDate(String transferBoardRegDate) {
		this.transferBoardRegDate = transferBoardRegDate;
	}

	public String getTransferDate() {
		return transferDate;
	}

	public void setTransferDate(String transferDate) {
		this.transferDate = transferDate;
	}

	public int getBuyUserSq() {
		return buyUserSq;
	}

	public void setBuyUserSq(int buyUserSq) {
		this.buyUserSq = buyUserSq;
	}

	public int getSellUserSq() {
		return sellUserSq;
	}

	public void setSellUserSq(int sellUserSq) {
		this.sellUserSq = sellUserSq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getTicketSq() {
		return ticketSq;
	}

	public void setTicketSq(int ticketSq) {
		this.ticketSq = ticketSq;
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

	public int getShowSq() {
		return showSq;
	}

	public void setShowSq(int showSq) {
		this.showSq = showSq;
	}

	public String getSubImage() {
		return subImage;
	}

	public void setSubImage(String subImage) {
		this.subImage = subImage;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}
	
	public String getSellUser() {
		return sellUser;
	}

	public void setSellUser(String sellUser) {
		this.sellUser = sellUser;
	}

	public String getBuyUser() {
		return buyUser;
	}

	public void setBuyUser(String buyUser) {
		this.buyUser = buyUser;
	}

	public int getTicketSeatPrice() {
		return ticketSeatPrice;
	}

	public void setTicketSeatPrice(int ticketSeatPrice) {
		this.ticketSeatPrice = ticketSeatPrice;
	}

	@Override
	public String toString() {
		return "TransferBoardVO [transferBoardSq=" + transferBoardSq + ", hopePrice=" + hopePrice + ", transferStat="
				+ transferStat + ", transferBoardContent=" + transferBoardContent + ", transferBoardRegDate="
				+ transferBoardRegDate + ", transferDate=" + transferDate + ", buyUserSq=" + buyUserSq + ", sellUserSq="
				+ sellUserSq + ", sellUser=" + sellUser + ", buyUser=" + buyUser + ", userId=" + userId + ", ticketSq="
				+ ticketSq + ", ticketSeatPrice=" + ticketSeatPrice + ", ticketSeat=" + ticketSeat + ", startTime="
				+ startTime + ", seatClass=" + seatClass + ", showSq=" + showSq + ", subImage=" + subImage
				+ ", showName=" + showName + ", getSeatClass()=" + getSeatClass() + ", getTransferBoardSq()="
				+ getTransferBoardSq() + ", getHopePrice()=" + getHopePrice() + ", getTransferStat()="
				+ getTransferStat() + ", getTransferBoardContent()=" + getTransferBoardContent()
				+ ", getTransferBoardRegDate()=" + getTransferBoardRegDate() + ", getTransferDate()="
				+ getTransferDate() + ", getBuyUserSq()=" + getBuyUserSq() + ", getSellUserSq()=" + getSellUserSq()
				+ ", getUserId()=" + getUserId() + ", getTicketSq()=" + getTicketSq() + ", getTicketSeat()="
				+ getTicketSeat() + ", getStartTime()=" + getStartTime() + ", getShowSq()=" + getShowSq()
				+ ", getSubImage()=" + getSubImage() + ", getShowName()=" + getShowName() + ", getSellUser()="
				+ getSellUser() + ", getBuyUser()=" + getBuyUser() + ", getTicketSeatPrice()=" + getTicketSeatPrice()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

}