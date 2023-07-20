package com.yes24.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.MyPageDAO;
import com.yes24.dao.UserDAO;
import com.yes24.vo.MyTicketingVO;
import com.yes24.vo.UserVO;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;
	@Autowired
	private UserDAO userDAO;

	// 나의 예매 내역 가져오기
	public Map<String, Object> myTicketingList(int no, UserVO vo,int stat) {
		System.out.println("myTicketingList Service()");

		Map<String, Object> map = new HashMap<>();
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("userSq", no);	
		parameter.put("stat", stat);	

		List<MyTicketingVO> myTicketingList = myPageDAO.myTicketingList(parameter);
		UserVO userVO = userDAO.getUser(vo);

		map.put("myTicketingList", myTicketingList);
		map.put("userVO", userVO);

		return map;
	}
}
