package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class ShowingSeatVO {

	private int showingSeatSq;
	private String showingSeatNo;
	private int showingSeatStat;
	private int showingSq;
	private int seatClassSq;

	public ShowingSeatVO() {
		super();
	}

	public ShowingSeatVO(int showingSeatSq, String showingSeatNo, int showingSeatStat, int showingSq, int seatClassSq) {
		super();
		this.showingSeatSq = showingSeatSq;
		this.showingSeatNo = showingSeatNo;
		this.showingSeatStat = showingSeatStat;
		this.showingSq = showingSq;
		this.seatClassSq = seatClassSq;
	}

	public int getShowingSeatSq() {
		return showingSeatSq;
	}

	public void setShowingSeatSq(int showingSeatSq) {
		this.showingSeatSq = showingSeatSq;
	}

	public String getShowingSeatNo() {
		return showingSeatNo;
	}

	public void setShowingSeatNo(String showingSeatNo) {
		this.showingSeatNo = showingSeatNo;
	}

	public int getShowingSeatStat() {
		return showingSeatStat;
	}

	public void setShowingSeatStat(int showingSeatStat) {
		this.showingSeatStat = showingSeatStat;
	}

	public int getShowingSq() {
		return showingSq;
	}

	public void setShowingSq(int showingSq) {
		this.showingSq = showingSq;
	}

	public int getSeatClassSq() {
		return seatClassSq;
	}

	public void setSeatClassSq(int seatClassSq) {
		this.seatClassSq = seatClassSq;
	}

	@Override
	public String toString() {
		return "ShowingSeatVO [showingSeatSq=" + showingSeatSq + ", showingSeatNo=" + showingSeatNo
				+ ", showingSeatStat=" + showingSeatStat + ", showingSq=" + showingSq + ", seatClassSq=" + seatClassSq
				+ "]";
	}

}
