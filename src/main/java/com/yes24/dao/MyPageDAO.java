package com.yes24.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.AlarmVO;
import com.yes24.vo.MyTicketingVO;
import com.yes24.vo.NotificationVO;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSession sqlSession;

	// ------------------ 나의 예매 내역 가져오기
	public List<MyTicketingVO> myTicketingList(Map<String, Object> map) {
		System.out.println("myTicketingList DAO()");

		return sqlSession.selectList("mypage.myTicketingList", map);

	}

	// ------------------ 나의 양도 등록 내역 가져오기
	public List<MyTicketingVO> myTransferTicketList(int no) {
		System.out.println("myTransferTicketList DAO()");

		return sqlSession.selectList("mypage.myTransferTicketList", no);

	}

	// ------------------ 알림신청 리스트
	public List<AlarmVO> myTransferAlarmList(int no) {
		System.out.println("myTransferAlarmList DAO()");

		return sqlSession.selectList("alarm.myTransferAlarmList", no);

	}

	// ------------------ 알림함리스트 가져오기
	public List<NotificationVO> myNotificationList(int no) {
		System.out.println("myNotificationList DAO()");

		return sqlSession.selectList("alarm.myNotificationList", no);

	}

}
