package com.yes24.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ShowVO {

	private int showSq;
	private String mainImage;
	private String subImage;
	private String startDate;
	private String endDate;
	private String reservationDate;
	private String showName;
	private String cast;
	private String director;
	private String showTime;
	private String viewingAge;
	private int category;
	private int showStat;
	//공연장
	private int concertHallSq;
	private String concertHallName;
	//상세이미지 배열
	private List<Integer> detailedImageSq; 
	private List<String> detailedImage;
	//좌석클래스 배열
	private List<Integer> seatClassSq;
	private List<String> seatClass;
	private List<Integer> seatPrice;

	public ShowVO() {
		super();
	}

	public ShowVO(int showSq, String mainImage, String subImage, String startDate, String endDate,
			String reservationDate, String showName, String cast, String director, String showTime, String viewingAge,
			int category, int showStat, int concertHallSq, String concertHallName, List<Integer> detailedImageSq,
			List<String> detailedImage, List<Integer> seatClassSq, List<String> seatClass, List<Integer> seatPrice) {
		super();
		this.showSq = showSq;
		this.mainImage = mainImage;
		this.subImage = subImage;
		this.startDate = startDate;
		this.endDate = endDate;
		this.reservationDate = reservationDate;
		this.showName = showName;
		this.cast = cast;
		this.director = director;
		this.showTime = showTime;
		this.viewingAge = viewingAge;
		this.category = category;
		this.showStat = showStat;
		this.concertHallSq = concertHallSq;
		this.concertHallName = concertHallName;
		this.detailedImageSq = detailedImageSq;
		this.detailedImage = detailedImage;
		this.seatClassSq = seatClassSq;
		this.seatClass = seatClass;
		this.seatPrice = seatPrice;
	}

	public int getshowSq() {
		return showSq;
	}

	public void setshowSq(int showSq) {
		this.showSq = showSq;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getSubImage() {
		return subImage;
	}

	public void setSubImage(String subImage) {
		this.subImage = subImage;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getShowTime() {
		return showTime;
	}

	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}

	public String getViewingAge() {
		return viewingAge;
	}

	public void setViewingAge(String viewingAge) {
		this.viewingAge = viewingAge;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getShowStat() {
		return showStat;
	}

	public void setShowStat(int showStat) {
		this.showStat = showStat;
	}

	public int getConcertHallSq() {
		return concertHallSq;
	}

	public void setConcertHallSq(int concertHallSq) {
		this.concertHallSq = concertHallSq;
	}

	public String getConcertHallName() {
		return concertHallName;
	}

	public void setConcertHallName(String concertHallName) {
		this.concertHallName = concertHallName;
	}

	public List<Integer> getDetailedImageSq() {
		return detailedImageSq;
	}

	public void setDetailedImageSq(List<Integer> detailedImageSq) {
		this.detailedImageSq = detailedImageSq;
	}

	public List<String> getDetailedImage() {
		return detailedImage;
	}

	public void setDetailedImage(List<String> detailedImage) {
		this.detailedImage = detailedImage;
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
		return "ShowVO [showSq=" + showSq + ", mainImage=" + mainImage + ", subImage=" + subImage + ", startDate="
				+ startDate + ", endDate=" + endDate + ", reservationDate=" + reservationDate + ", showName=" + showName
				+ ", cast=" + cast + ", director=" + director + ", showTime=" + showTime + ", viewingAge=" + viewingAge
				+ ", category=" + category + ", showStat=" + showStat + ", concertHallSq=" + concertHallSq
				+ ", concertHallName=" + concertHallName + ", detailedImageSq=" + detailedImageSq + ", detailedImage="
				+ detailedImage + ", seatClassSq=" + seatClassSq + ", seatClass=" + seatClass + ", seatPrice="
				+ seatPrice + "]";
	}

	

	

}