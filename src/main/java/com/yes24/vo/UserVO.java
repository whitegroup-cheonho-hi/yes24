package com.yes24.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class UserVO {

	private int userSq;
	private String userId;
	private String userPassword;
	private String userName;
	private String userBirthday;
	private String gender;
	private String userPhone;
	private String userEmail;
	private String userPost;
	private String userBasicAddr;
	private String userDetailAddr;
	private Date userJoinDate;
	private Date userWithdrawalDate;
	private int userRole;
	private int userStat;


	public UserVO() {
		super();
	}


	public UserVO(int userSq, String userId, String userPassword, String userName, String userBirthday, String gender,
			String userPhone, String userEmail, String userPost, String userBasicAddr, String userDetailAddr,
			Date userJoinDate, Date userWithdrawalDate, int userRole, int userStat) {
		super();
		this.userSq = userSq;
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userBirthday = userBirthday;
		this.gender = gender;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userPost = userPost;
		this.userBasicAddr = userBasicAddr;
		this.userDetailAddr = userDetailAddr;
		this.userJoinDate = userJoinDate;
		this.userWithdrawalDate = userWithdrawalDate;
		this.userRole = userRole;
		this.userStat = userStat;
	}


	public int getUserSq() {
		return userSq;
	}


	public void setUserSq(int userSq) {
		this.userSq = userSq;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPassword() {
		return userPassword;
	}


	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserBirthday() {
		return userBirthday;
	}


	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserPost() {
		return userPost;
	}


	public void setUserPost(String userPost) {
		this.userPost = userPost;
	}


	public String getUserBasicAddr() {
		return userBasicAddr;
	}


	public void setUserBasicAddr(String userBasicAddr) {
		this.userBasicAddr = userBasicAddr;
	}


	public String getUserDetailAddr() {
		return userDetailAddr;
	}


	public void setUserDetailAddr(String userDetailAddr) {
		this.userDetailAddr = userDetailAddr;
	}


	public Date getUserJoinDate() {
		return userJoinDate;
	}


	public void setUserJoinDate(Date userJoinDate) {
		this.userJoinDate = userJoinDate;
	}


	public Date getUserWithdrawalDate() {
		return userWithdrawalDate;
	}


	public void setUserWithdrawalDate(Date userWithdrawalDate) {
		this.userWithdrawalDate = userWithdrawalDate;
	}


	public int getUserRole() {
		return userRole;
	}


	public void setUserRole(int userRole) {
		this.userRole = userRole;
	}


	public int getUserStat() {
		return userStat;
	}


	public void setUserStat(int userStat) {
		this.userStat = userStat;
	}


	@Override
	public String toString() {
		return "UserVO [userSq=" + userSq + ", userId=" + userId + ", userPassword=" + userPassword + ", userName="
				+ userName + ", userBirthday=" + userBirthday + ", gender=" + gender + ", userPhone=" + userPhone
				+ ", userEmail=" + userEmail + ", userPost=" + userPost + ", userBasicAddr=" + userBasicAddr
				+ ", userDetailAddr=" + userDetailAddr + ", userJoinDate=" + userJoinDate + ", userWithdrawalDate="
				+ userWithdrawalDate + ", userRole=" + userRole + ", userStat=" + userStat + "]";
	}

	

}
