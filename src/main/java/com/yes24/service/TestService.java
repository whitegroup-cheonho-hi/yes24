package com.yes24.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.TestDAO;
import com.yes24.dto.PageMakerDTO;
import com.yes24.vo.Criteria;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;

@Service
public class TestService {

	@Autowired
	private TestDAO testdao;
	

	public ShowVO getShow(int no) {
		return testdao.getShow(no);
	} 
	
	// 공연상태로 공연정보 가져오기
	public Map<String, Object> getShowList(Criteria cri){
		System.out.println("getShowList Service()");
		
		Map<String, Object> map = new HashMap<>();
		System.out.println(cri);
		List<ShowVO> list = testdao.getShowList(cri);
		int total = testdao.getTotal(cri);
		
		PageMakerDTO pageMake = new PageMakerDTO(total, cri);
		System.out.println(pageMake);
		System.out.println(list);
		
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
		
	//상태별 공연갯수 가져오기
	public int getTotal(Criteria cri) {
		return testdao.getTotal(cri);
	}
	
}