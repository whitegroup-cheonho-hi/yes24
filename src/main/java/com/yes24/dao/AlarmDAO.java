package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.AlarmVO;

@Repository
public class AlarmDAO {

	@Autowired
	private SqlSession sqlSession;

	// ------------ 양도 알람 등록
	public int insertAlarm(AlarmVO vo) {
		System.out.println("insertAlarm DAO()");

		return sqlSession.insert("alarm.insertAlarm", vo);

	}

	// ------------ 티켓번호로 알람비교문
	public AlarmVO getAlarm(int no) {
		System.out.println("getAlarm DAO()");

		return sqlSession.selectOne("alarm.getAlarm", no);

	}

	// ------------ 티켓번호로 알람비교문
	public List<AlarmVO> alarmCheck(AlarmVO vo) {
		System.out.println("alarmCheck DAO()");

		return sqlSession.selectList("alarm.alarmCheck", vo);

	}

	// ------------ 알림함 등
	public int insertNotification(AlarmVO vo) {
		System.out.println("insertNotification DAO()");

		return sqlSession.insert("alarm.insertNotification", vo);

	}
	

}
