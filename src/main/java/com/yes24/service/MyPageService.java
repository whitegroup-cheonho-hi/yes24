package com.yes24.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.MyPageDAO;
import com.yes24.vo.MyTicketingVO;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;

	// 나의 예매 내역 가져오기
	public List<MyTicketingVO> myTicketingList(int no) {
		System.out.println("myTicketingList Service()");

		return myPageDAO.myTicketingList(no);
	}
}
