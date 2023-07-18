package com.yes24.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.TestDAO;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;

@Service
public class TestService {

	@Autowired
	private TestDAO testdao;


	public ShowVO getShow(int no) {
		return testdao.getShow(no);
	}

	// 공연번호 날짜로 회차정보 가지고오기
	public List<ShowingVO> getShowing(ShowingVO vo) {
		//System.out.println("getShowing Service()");
		return testdao.getShowing(vo);
	}
	//회차 입력
	public int InsertShowing(ShowingVO vo) {
		System.out.println("InsertShowing Service()");
		return testdao.InsertShowing(vo);
	}
}