package com.yes24.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class SaveTicketVO {

	private int showingSq;
	private int showSq;
	private List<String> seatClass;
	private List<String> seatNo;
	private List<Integer> seatPrice;
	public SaveTicketVO() {
		super();
	}
	public SaveTicketVO(int showingSq, int showSq, List<String> seatClass, List<String> seatNo,
			List<Integer> seatPrice) {
		super();
		this.showingSq = showingSq;
		this.showSq = showSq;
		this.seatClass = seatClass;
		this.seatNo = seatNo;
		this.seatPrice = seatPrice;
	}
	public int getShowingSq() {
		return showingSq;
	}
	public void setShowingSq(int showingSq) {
		this.showingSq = showingSq;
	}
	public int getShowSq() {
		return showSq;
	}
	public void setShowSq(int showSq) {
		this.showSq = showSq;
	}
	public List<String> getSeatClass() {
		return seatClass;
	}
	public void setSeatClass(List<String> seatClass) {
		this.seatClass = seatClass;
	}
	public List<String> getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(List<String> seatNo) {
		this.seatNo = seatNo;
	}
	public List<Integer> getSeatPrice() {
		return seatPrice;
	}
	public void setSeatPrice(List<Integer> seatPrice) {
		this.seatPrice = seatPrice;
	}
	@Override
	public String toString() {
		return "SaveTicketVO [showingSq=" + showingSq + ", showSq=" + showSq + ", seatClass=" + seatClass + ", seatNo="
				+ seatNo + ", seatPrice=" + seatPrice + "]";
	}
	
	
	
}
