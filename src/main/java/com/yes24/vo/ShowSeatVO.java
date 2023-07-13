package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class ShowSeatVO {

	private int seatSq;
	private int seatClassSq;
	
	public ShowSeatVO() {
		super();
	}

	public ShowSeatVO(int seatSq, int seatClassSq) {
		super();
		this.seatSq = seatSq;
		this.seatClassSq = seatClassSq;
	}

	public int getSeatSq() {
		return seatSq;
	}

	public void setSeatSq(int seatSq) {
		this.seatSq = seatSq;
	}

	public int getSeatClassSq() {
		return seatClassSq;
	}

	public void setSeatClassSq(int seatClassSq) {
		this.seatClassSq = seatClassSq;
	}

	@Override
	public String toString() {
		return "ShowSeatVO [seatSq=" + seatSq + ", seatClassSq=" + seatClassSq + "]";
	}

		
	
}
