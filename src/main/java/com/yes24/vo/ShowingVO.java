package com.yes24.vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ShowingVO {

	private int showingSq;
	private String showingDate;
	private String startTime;
	private String endTime;
	private String showInformation;
	private String showingStat;
	// 공연
	private int showSq;
	// 회차좌석 배열
	private List<Integer> showingSeatSq;
	private List<String> showingSeatNO;
	private List<Integer> showingSeatStat;
	// 좌석구분
	private List<Integer> seatClassSq;
	private List<String> seatClass;
	private List<Integer> seatPrice;

	public ShowingVO() {
		super();
	}

	public ShowingVO(int showingSq, String showingDate, String startTime, String endTime, String showInformation,
			String showingStat, int showSq, List<Integer> showingSeatSq, List<String> showingSeatNO,
			List<Integer> showingSeatStat, List<Integer> seatClassSq, List<String> seatClass, List<Integer> seatPrice) {
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

	public List<Integer> getShowingSeatSq() {
		return showingSeatSq;
	}

	public void setShowingSeatSq(List<Integer> showingSeatSq) {
		this.showingSeatSq = showingSeatSq;
	}

	public List<String> getShowingSeatNO() {
		return showingSeatNO;
	}

	public void setShowingSeatNO(List<String> showingSeatNO) {
		this.showingSeatNO = showingSeatNO;
	}

	public List<Integer> getShowingSeatStat() {
		return showingSeatStat;
	}

	public void setShowingSeatStat(List<Integer> showingSeatStat) {
		this.showingSeatStat = showingSeatStat;
	}

	public List<Integer> getSeatClassSq() {
		return seatClassSq;
	}

	public void setSeatClassSq(List<Integer> seatClassSq) {
		this.seatClassSq = seatClassSq;
	}

	public List<String> getSeatClass() {
		return seatClass;
	}

	public void setSeatClass(List<String> seatClass) {
		this.seatClass = seatClass;
	}

	public List<Integer> getSeatPrice() {
		return seatPrice;
	}

	public void setSeatPrice(List<Integer> seatPrice) {
		this.seatPrice = seatPrice;
	}

	@Override
	public String toString() {
		return "ShowingVO [showingSq=" + showingSq + ", showingDate=" + showingDate + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", showInformation=" + showInformation + ", showingStat=" + showingStat
				+ ", showSq=" + showSq + ", showingSeatSq=" + showingSeatSq + ", showingSeatNO=" + showingSeatNO
				+ ", showingSeatStat=" + showingSeatStat + ", seatClassSq=" + seatClassSq + ", seatClass=" + seatClass
				+ ", seatPrice=" + seatPrice + "]";
	}

}
