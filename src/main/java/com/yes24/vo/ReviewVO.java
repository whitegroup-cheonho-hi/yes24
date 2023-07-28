package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class ReviewVO {

	private int reviewSq;
	private String userId;
	private String reviewContent;
	private String reviewRegDate;
	private String viewingday;
	private int grade;
	// 회원
	private int userSq;
	// 공연
	private int showSq;

	public ReviewVO() {
		super();
	}

	public ReviewVO(int reviewSq, String userId, String reviewContent, String reviewRegDate, String viewingday,
			int grade, int userSq, int showSq) {
		super();
		this.reviewSq = reviewSq;
		this.userId = userId;
		this.reviewContent = reviewContent;
		this.reviewRegDate = reviewRegDate;
		this.viewingday = viewingday;
		this.grade = grade;
		this.userSq = userSq;
		this.showSq = showSq;
	}

	public int getReviewSq() {
		return reviewSq;
	}

	public void setReviewSq(int reviewSq) {
		this.reviewSq = reviewSq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewRegDate() {
		return reviewRegDate;
	}

	public void setReviewRegDate(String reviewRegDate) {
		this.reviewRegDate = reviewRegDate;
	}

	public String getViewingday() {
		return viewingday;
	}

	public void setViewingday(String viewingday) {
		this.viewingday = viewingday;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getUserSq() {
		return userSq;
	}

	public void setUserSq(int userSq) {
		this.userSq = userSq;
	}

	public int getShowSq() {
		return showSq;
	}

	public void setShowSq(int showSq) {
		this.showSq = showSq;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewSq=" + reviewSq + ", userId=" + userId + ", reviewContent=" + reviewContent
				+ ", reviewRegDate=" + reviewRegDate + ", viewingday=" + viewingday + ", grade=" + grade + ", userSq="
				+ userSq + ", showSq=" + showSq + "]";
	}

}
