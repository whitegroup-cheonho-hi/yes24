package com.yes24.vo;

import org.springframework.stereotype.Component;

@Component
public class MessageVO {

	private int userSq;
	private int transferBoardSq;
	private String showName;
	private String content;

	public MessageVO() {
		super();
	}

	public MessageVO(int userSq, int transferBoardSq, String showName, String content) {
		super();
		this.userSq = userSq;
		this.transferBoardSq = transferBoardSq;
		this.showName = showName;
		this.content = content;
	}

	public int getUserSq() {
		return userSq;
	}

	public void setUserSq(int userSq) {
		this.userSq = userSq;
	}

	public int getTransferBoardSq() {
		return transferBoardSq;
	}

	public void setTransferBoardSq(int transferBoardSq) {
		this.transferBoardSq = transferBoardSq;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "MessageVO [userSq=" + userSq + ", transferBoardSq=" + transferBoardSq + ", showName=" + showName
				+ ", content=" + content + "]";
	}

}
