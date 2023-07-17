package com.yes24.vo;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class ShowingVO {
	
	private int showingSq;
	private String showingDate;
	private String startTime;
	private String endTime;
	private String showInformation;
	private String showingStat;
	//공연
	private int showSq;
	//회차좌석 배열
	private int[] showingSeatSq;
	private String[] showingSeatNO;
	private int[] showingSeatStat;
	//좌석구분
	private int[] seatClassSq;
	private String[] seatClass;
	private int[] seatPrice;
	
	public ShowingVO() {
		super();
	}

	public ShowingVO(int showingSq, String showingDate, String startTime, String endTime, String showInformation,
			String showingStat, int showSq, int[] showingSeatSq, String[] showingSeatNO, int[] showingSeatStat,
			int[] seatClassSq, String[] seatClass, int[] seatPrice) {
		super();
		this.showingSq = showingSq;
		this.showingDate = showingDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.showInformation = showInformation;
		this.showingStat = showingStat;
		this.showSq = showSq;
		this.showingSeatSq = showingSeatSq;
		this.showingSeatNO = showingSeatNO;
		this.showingSeatStat = showingSeatStat;
		this.seatClassSq = seatClassSq;
		this.seatClass = seatClass;
		this.seatPrice = seatPrice;
	}


	public int getShowingSq() {
		return showingSq;
	}

	public void setShowingSq(int showingSq) {
		this.showingSq = showingSq;
	}


	public String getShowingDate() {
		return showingDate;
	}

	public void setShowingDate(String showingDate) {
		this.showingDate = showingDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getShowInformation() {
		return showInformation;
	}

	public void setShowInformation(String showInformation) {
		this.showInformation = showInformation;
	}

	public String getShowingStat() {
		return showingStat;
	}

	public void setShowingStat(String showingStat) {
		this.showingStat = showingStat;
	}

	public int getShowSq() {
		return showSq;
	}

	public void setShowSq(int showSq) {
		this.showSq = showSq;
	}

	public int[] getShowingSeatSq() {
		return showingSeatSq;
	}

	public void setShowingSeatSq(int[] showingSeatSq) {
		this.showingSeatSq = showingSeatSq;
	}

	public String[] getShowingSeatNO() {
		return showingSeatNO;
	}

	public void setShowingSeatNO(String[] showingSeatNO) {
		this.showingSeatNO = showingSeatNO;
	}

	public int[] getShowingSeatStat() {
		return showingSeatStat;
	}

	public void setShowingSeatStat(int[] showingSeatStat) {
		this.showingSeatStat = showingSeatStat;
	}

	public int[] getSeatClassSq() {
		return seatClassSq;
	}

	public void setSeatClassSq(int[] seatClassSq) {
		this.seatClassSq = seatClassSq;
	}

	public String[] getSeatClass() {
		return seatClass;
	}

	public void setSeatClass(String[] seatClass) {
		this.seatClass = seatClass;
	}

	public int[] getSeatPrice() {
		return seatPrice;
	}

	public void setSeatPrice(int[] seatPrice) {
		this.seatPrice = seatPrice;
	}

	@Override
	public String toString() {
		return "ShowingVO [showingSq=" + showingSq + ", showingDate=" + showingDate + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", showInformation=" + showInformation + ", showingStat=" + showingStat
				+ ", showSq=" + showSq + ", showingSeatSq=" + Arrays.toString(showingSeatSq) + ", showingSeatNO="
				+ Arrays.toString(showingSeatNO) + ", showingSeatStat=" + Arrays.toString(showingSeatStat)
				+ ", seatClassSq=" + Arrays.toString(seatClassSq) + ", seatClass=" + Arrays.toString(seatClass)
				+ ", seatPrice=" + Arrays.toString(seatPrice) + "]";
	}

	
}
