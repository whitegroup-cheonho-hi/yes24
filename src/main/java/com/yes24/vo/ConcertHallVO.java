package com.yes24.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ConcertHallVO {

	private int concertHallSq;
	private String concertHallName;
	private String concertHallPost;
	private String concertHallBasicAddr;
	private String concertHallDetailAddr;
	private int concertHallWidth;
	private int concertHallHeight;
	// 좌석
	private List<Integer> seatSq;
	private List<String> seatNo;

	public ConcertHallVO() {
		super();
	}

	public ConcertHallVO(int concertHallSq, String concertHallName, String concertHallPost, String concertHallBasicAddr,
			String concertHallDetailAddr, int concertHallWidth, int concertHallHeight, List<Integer> seatSq,
			List<String> seatNo) {
		super();
		this.concertHallSq = concertHallSq;
		this.concertHallName = concertHallName;
		this.concertHallPost = concertHallPost;
		this.concertHallBasicAddr = concertHallBasicAddr;
		this.concertHallDetailAddr = concertHallDetailAddr;
		this.concertHallWidth = concertHallWidth;
		this.concertHallHeight = concertHallHeight;
		this.seatSq = seatSq;
		this.seatNo = seatNo;
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

	public String getConcertHallPost() {
		return concertHallPost;
	}

	public void setConcertHallPost(String concertHallPost) {
		this.concertHallPost = concertHallPost;
	}

	public String getConcertHallBasicAddr() {
		return concertHallBasicAddr;
	}

	public void setConcertHallBasicAddr(String concertHallBasicAddr) {
		this.concertHallBasicAddr = concertHallBasicAddr;
	}

	public String getConcertHallDetailAddr() {
		return concertHallDetailAddr;
	}

	public void setConcertHallDetailAddr(String concertHallDetailAddr) {
		this.concertHallDetailAddr = concertHallDetailAddr;
	}

	public int getConcertHallWidth() {
		return concertHallWidth;
	}

	public void setConcertHallWidth(int concertHallWidth) {
		this.concertHallWidth = concertHallWidth;
	}

	public int getConcertHallHeight() {
		return concertHallHeight;
	}

	public void setConcertHallHeight(int concertHallHeight) {
		this.concertHallHeight = concertHallHeight;
	}

	public List<Integer> getSeatSq() {
		return seatSq;
	}

	public void setSeatSq(List<Integer> seatSq) {
		this.seatSq = seatSq;
	}

	public List<String> getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(List<String> seatNo) {
		this.seatNo = seatNo;
	}

	@Override
	public String toString() {
		return "ConcertHallVO [concertHallSq=" + concertHallSq + ", concertHallName=" + concertHallName
				+ ", concertHallPost=" + concertHallPost + ", concertHallBasicAddr=" + concertHallBasicAddr
				+ ", concertHallDetailAddr=" + concertHallDetailAddr + ", concertHallWidth=" + concertHallWidth
				+ ", concertHallHeight=" + concertHallHeight + ", seatSq=" + seatSq + ", seatNo=" + seatNo + "]";
	}

}
