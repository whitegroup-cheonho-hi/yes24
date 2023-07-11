package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class SeatVO {
	
	private int seatSq;
	private String seatNo;
	private int concertHallSq;
	
	
	public SeatVO() {
		super();
	}


	public SeatVO(int seatSq, String seatNo, int concertHallSq) {
		super();
		this.seatSq = seatSq;
		this.seatNo = seatNo;
		this.concertHallSq = concertHallSq;
	}


	public int getSeatSq() {
		return seatSq;
	}


	public void setSeatSq(int seatSq) {
		this.seatSq = seatSq;
	}


	public String getSeatNo() {
		return seatNo;
	}


	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}


	public int getConcertHallSq() {
		return concertHallSq;
	}


	public void setConcertHallSq(int concertHallSq) {
		this.concertHallSq = concertHallSq;
	}


	@Override
	public String toString() {
		return "SeatVO [seatSq=" + seatSq + ", seatNo=" + seatNo + ", concertHallSq=" + concertHallSq + "]";
	}
	
	
}
