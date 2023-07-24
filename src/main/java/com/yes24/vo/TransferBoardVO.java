package com.yes24.vo;

import java.sql.Date;

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
	// 티켓
	private int ticketSq;
	// 공연
	private int showSq;
	private String subImage;

	public TransferBoardVO() {
		super();
	}

	public TransferBoardVO(int transferBoardSq, int hopePrice, String transferStat, String transferBoardContent,
			String transferBoardRegDate, String transferDate, int buyUserSq, int sellUserSq, int ticketSq, int showSq,
			String subImage) {
		super();
		this.transferBoardSq = transferBoardSq;
		this.hopePrice = hopePrice;
		this.transferStat = transferStat;
		this.transferBoardContent = transferBoardContent;
		this.transferBoardRegDate = transferBoardRegDate;
		this.transferDate = transferDate;
		this.buyUserSq = buyUserSq;
		this.sellUserSq = sellUserSq;
		this.ticketSq = ticketSq;
		this.showSq = showSq;
		this.subImage = subImage;
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

	public int getTicketSq() {
		return ticketSq;
	}

	public void setTicketSq(int ticketSq) {
		this.ticketSq = ticketSq;
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

	@Override
	public String toString() {
		return "TransferBoardVO [transferBoardSq=" + transferBoardSq + ", hopePrice=" + hopePrice + ", transferStat="
				+ transferStat + ", transferBoardContent=" + transferBoardContent + ", transferBoardRegDate="
				+ transferBoardRegDate + ", transferDate=" + transferDate + ", buyUserSq=" + buyUserSq + ", sellUserSq="
				+ sellUserSq + ", ticketSq=" + ticketSq + ", showSq=" + showSq + ", subImage=" + subImage + "]";
	}

	
}