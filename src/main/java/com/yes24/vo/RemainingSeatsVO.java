package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class RemainingSeatsVO {

	private String seatClass;
	private int seatClassSq;
	private int seatPrice;
	private int seatEa;
	public RemainingSeatsVO() {
		super();
	}
	public RemainingSeatsVO(String seatClass, int seatClassSq, int seatPrice, int seatEa) {
		super();
		this.seatClass = seatClass;
		this.seatClassSq = seatClassSq;
		this.seatPrice = seatPrice;
		this.seatEa = seatEa;
	}
	public String getSeatClass() {
		return seatClass;
	}
	public void setSeatClass(String seatClass) {
		this.seatClass = seatClass;
	}
	public int getSeatClassSq() {
		return seatClassSq;
	}
	public void setSeatClassSq(int seatClassSq) {
		this.seatClassSq = seatClassSq;
	}
	public int getSeatPrice() {
		return seatPrice;
	}
	public void setSeatPrice(int seatPrice) {
		this.seatPrice = seatPrice;
	}
	public int getSeatEa() {
		return seatEa;
	}
	public void setSeatEa(int seatEa) {
		this.seatEa = seatEa;
	}
	@Override
	public String toString() {
		return "RemainingSeatsVO [seatClass=" + seatClass + ", seatClassSq=" + seatClassSq + ", seatPrice=" + seatPrice
				+ ", seatEa=" + seatEa + "]";
	}
	
	
}
