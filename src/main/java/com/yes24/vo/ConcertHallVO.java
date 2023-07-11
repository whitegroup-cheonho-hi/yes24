package com.yes24.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ConcertHallVO {

	private int concertHallSq;
	private String concertHallName;
	private String concertHallPost;
	private String concertHallRoadAddr;
	private String concertHallJibunAddr;
	private int concertHallWidth;
	private int concertHallHeight;
	// 좌석
	private List<Integer> seatSq;
	private List<String> seatNo;

	public ConcertHallVO() {
		super();
	}

	public ConcertHallVO(int concertHallSq, String concertHallName, String concertHallPost, String concertHallRoadAddr,
			String concertHallJibunAddr, int concertHallWidth, int concertHallHeight, List<Integer> seatSq,
			List<String> seatNo) {
		super();
		this.concertHallSq = concertHallSq;
		this.concertHallName = concertHallName;
		this.concertHallPost = concertHallPost;
		this.concertHallRoadAddr = concertHallRoadAddr;
		this.concertHallJibunAddr = concertHallJibunAddr;
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

	public String getConcertHallRoadAddr() {
		return concertHallRoadAddr;
	}

	public void setConcertHallRoadAddr(String concertHallRoadAddr) {
		this.concertHallRoadAddr = concertHallRoadAddr;
	}

	public String getConcertHallJibunAddr() {
		return concertHallJibunAddr;
	}

	public void setConcertHallJibunAddr(String concertHallJibunAddr) {
		this.concertHallJibunAddr = concertHallJibunAddr;
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
				+ ", concertHallPost=" + concertHallPost + ", concertHallRoadAddr=" + concertHallRoadAddr
				+ ", concertHallJibunAddr=" + concertHallJibunAddr + ", concertHallWidth=" + concertHallWidth
				+ ", concertHallHeight=" + concertHallHeight + ", seatSq=" + seatSq + ", seatNo=" + seatNo + "]";
	}

	
}
