package com.yes24.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.AlarmDAO;
import com.yes24.dao.ShowDAO;
import com.yes24.vo.AlarmVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowVO;

@Service
public class AlarmService {

	@Autowired
	private AlarmDAO alarmDAO;
	@Autowired
	private ShowDAO showDAO;

	// -------------- 공연이름으로 검색
	public List<ShowVO> getShowName(String showName) {
		System.out.println("getShowName Service()");

		return showDAO.getShowName(showName);
	}

	// --------------- 좌석클래스 가져오기
	public List<SeatClassVO> getSeatClassList(int no) {
		System.out.println("getSeatClassList Service() ");

		return showDAO.getSeatClassList(no);
	}

	// --------------- 양도 알람 등록
	public int insertAlarm(AlarmVO vo) {
		System.out.println("insertAlarm Service()");

		// 문자열로 합쳐서 보내기
		StringBuffer sb = new StringBuffer();

		for (String c : vo.getSeatClass()) {

			sb.append(c);
			sb.append(", ");

		}
		// 마지막 ,"" 제거
		sb.deleteCharAt(sb.length() - 2);

		// 좌석문자열 합쳐서
		vo.setSeatClasss(sb.toString());

		return alarmDAO.insertAlarm(vo);

	}

}
