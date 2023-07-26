package com.yes24.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.AlarmDAO;
import com.yes24.dao.ShowDAO;
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
	
	
	
	
	
	
	
	
	
}
