package com.yes24.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class SeatClassListVO {
	
	
	private int seatClassSq;
	//좌석클래스 이름
	private String seatClass;
	//좌석클래스 가격
	private int seatPrice;
	//첫번째 클래스 좌석들
	private List<String> seatClassList;
	//공연번호
	private int showSq;
	//공연장 번호
	private int concertHallSq;
	
	public SeatClassListVO() {
		super();
	}

	public SeatClassListVO(int seatClassSq, String seatClass, int seatPrice, List<String> seatClassList, int showSq,
			int concertHallSq) {
		super();
		this.seatClassSq = seatClassSq;
		this.seatClass = seatClass;
		this.seatPrice = seatPrice;
		this.seatClassList = seatClassList;
		this.showSq = showSq;
		this.concertHallSq = concertHallSq;
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

	public List<String> getSeatClassList() {
		return seatClassList;
	}

	public void setSeatClassList(List<String> seatClassList) {
		this.seatClassList = seatClassList;
	}

	public int getShowSq() {
		return showSq;
	}

	public void setShowSq(int showSq) {
		this.showSq = showSq;
	}

	public int getConcertHallSq() {
		return concertHallSq;
	}

	public void setConcertHallSq(int concertHallSq) {
		this.concertHallSq = concertHallSq;
	}

	@Override
	public String toString() {
		return "SeatClassListVO [seatClassSq=" + seatClassSq + ", seatClass=" + seatClass + ", seatPrice=" + seatPrice
				+ ", seatClassList=" + seatClassList + ", showSq=" + showSq + ", concertHallSq=" + concertHallSq + "]";
	}
	
		
}
