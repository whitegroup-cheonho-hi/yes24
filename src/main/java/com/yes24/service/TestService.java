package com.yes24.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.TestDAO;
import com.yes24.dto.PageMakerDTO;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.Criteria;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;

@Service
public class TestService {

	@Autowired
	private TestDAO testdao;
	
	//공연시퀀스로 공연정보 가져오기
	public ShowVO getShow(int no) {
		return testdao.getShow(no);
	}
	
	//예매현황 정보 가져오기
	public Map<String, Object> getTicketingDetailHallName(int no){
		System.out.println("getTicketingDetailHallName Service()");
		Map<String, Object> map = new HashMap<>();
		ShowVO vo = testdao.getShow(no);
		ConcertHallVO hallName = testdao.getTicketingDetailHallName(vo);
		map.put("show", vo);
		map.put("hallName", hallName);
		System.out.println(map);
		return map;
	}
	
	
	//공연장 리스트 검색&페이징
	public Map<String, Object> getConcertHallList(Criteria cri){
		Map<String, Object> map = new HashMap<>();
		List<ConcertHallVO> hallList = testdao.getConcertHallList(cri);
		int total = testdao.getConcertHallTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(total, cri);
		map.put("pageMake", pageMake);
		map.put("hallList", hallList);
		return map;
	}
	
	// 공연상태로 공연정보 가져오기
	public Map<String, Object> getShowList(Criteria cri){
		Map<String, Object> map = new HashMap<>();
		List<ShowVO> list = testdao.getShowList(cri);
		int total = testdao.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(total, cri);
		map.put("pageMake", pageMake);
		map.put("list", list);
		return map;
	}

	// 공연번호 날짜로 회차정보 가지고오기
	public List<ShowingVO> getShowing(ShowingVO vo) {
		// System.out.println("getShowing Service()");
		return testdao.getShowing(vo);
	}

	// 회차 입력
	public int InsertShowing(ShowingVO vo) {
		System.out.println("InsertShowing Service()");
		return testdao.InsertShowing(vo);
	}

	// 회차 삭제
	public int DeleteShowing(String showingSq) {
		System.out.println("DeleteShowing Service()");
		return testdao.DeleteShowing(showingSq);
	}

	// 월별 공연일정
	public List<String> getShowingDay(int showSq) {
		System.out.println("getShowingDay Service()");
		List<String> list = testdao.getShowingDay(showSq);
		return list;
	}
	
	//예매시작 상태변경
	public int showUpdateStat(ShowVO vo) {
		System.out.println("showUpdateStat Service()");
		return testdao.showUpdateStat(vo);
	}
		
	
}