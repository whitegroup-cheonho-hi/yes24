package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class SeatClassVO {

	private int seatClassSq;
	private String seatClass;
	private int seatPrice;
	private int showSq;
	public SeatClassVO() {
		super();
	}
	public SeatClassVO(int seatClassSq, String seatClass, int seatPrice, int showSq) {
		super();
		this.seatClassSq = seatClassSq;
		this.seatClass = seatClass;
		this.seatPrice = seatPrice;
		this.showSq = showSq;
	}
	public int getSeatClassSq() {
		return seatClassSq;
	}
	public void setSeatClassSq(int seatClassSq) {
		this.seatClassSq = seatClassSq;
	}
	public String getSeatClass() {
		return seatClass;
	}
	public void setSeatClass(String seatClass) {
		this.seatClass = seatClass;
	}
	public int getSeatPrice() {
		return seatPrice;
	}
	public void setSeatPrice(int seatPrice) {
		this.seatPrice = seatPrice;
	}
	public int getShowSq() {
		return showSq;
	}
	public void setShowSq(int showSq) {
		this.showSq = showSq;
	}
	@Override
	public String toString() {
		return "SeatClassVO [seatClassSq=" + seatClassSq + ", seatClass=" + seatClass + ", seatPrice=" + seatPrice
				+ ", showSq=" + showSq + "]";
	}
	
	
}
