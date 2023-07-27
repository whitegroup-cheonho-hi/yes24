package com.yes24.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.MyPageDAO;
import com.yes24.dao.UserDAO;
import com.yes24.vo.AlarmVO;
import com.yes24.vo.MyTicketingVO;
import com.yes24.vo.NotificationVO;
import com.yes24.vo.UserVO;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;
	@Autowired
	private UserDAO userDAO;

	// 나의 예매 내역 가져오기
	public Map<String, Object> myTicketingList(int no, UserVO vo, int stat) {
		System.out.println("myTicketingList Service()");

		Map<String, Object> map = new HashMap<>();
		Map<String, Object> parameter = new HashMap<>();
		List<MyTicketingVO> myTicketingList = new ArrayList<>();
		// 알림창 만 그리기위한 예왜처리
		if (stat == 5) {

			List<AlarmVO> alarmList = myPageDAO.myTransferAlarmList(no);
			List<NotificationVO> notificationList = myPageDAO.myNotificationList(no);
			map.put("alarmList", alarmList);
			map.put("notificationList", notificationList);
			
			
		} else {
			parameter.put("userSq", no);
			parameter.put("stat", stat);
			myTicketingList = myPageDAO.myTicketingList(parameter);
			if (stat == 1) {

				List<MyTicketingVO> myTransferTicketList = myPageDAO.myTransferTicketList(no);
				map.put("myTransferTicketList", myTransferTicketList);

			}
			map.put("myTicketingList", myTicketingList);
			// 5는 알림리스트 가져오기
		}

		UserVO userVO = userDAO.getUser(vo);
		map.put("userVO", userVO);

		return map;
	}
}
