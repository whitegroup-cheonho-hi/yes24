package com.yes24.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.AdminDAO;
import com.yes24.dto.PageMakerDTO;
import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.Criteria;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;
import com.yes24.vo.TransferBoardVO;
import com.yes24.vo.UserTicketingVO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO admindao;

	// 공연시퀀스로 공연정보 가져오기
	public ShowVO getShow(int no) {
		return admindao.getShow(no);
	}

	// 양도리스트 가져오기
	public Map<String, Object> getTransferList(Criteria cri) {
		Map<String, Object> map = new HashMap<>();
		int total = admindao.getTransferTotal(cri);
		List<TransferBoardVO> list = admindao.getTransferList(cri);
		PageMakerDTO pageMake = new PageMakerDTO(total, cri);
		map.put("pageMake", pageMake);
		map.put("list", list);
		return map;
	}

	// 예매현황 정보 가져오기
	public Map<String, Object> getTicketingDetailHallName(int no) {
		Map<String, Object> map = new HashMap<>();
		ShowVO vo = admindao.getShow(no);
		ConcertHallVO hallName = admindao.getTicketingDetailHallName(vo);
		map.put("show", vo);
		map.put("hallName", hallName);
		return map;
	}

	// 공연장 리스트 검색&페이징
	public Map<String, Object> getConcertHallList(Criteria cri) {
		Map<String, Object> map = new HashMap<>();
		List<ConcertHallVO> hallList = admindao.getConcertHallList(cri);
		int total = admindao.getConcertHallTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(total, cri);
		map.put("pageMake", pageMake);
		map.put("hallList", hallList);
		return map;
	}

	// 공연상태로 공연정보 가져오기
	public Map<String, Object> getShowList(Criteria cri) {
		Map<String, Object> map = new HashMap<>();
		List<ShowVO> list = admindao.getShowList(cri);
		int total = admindao.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(total, cri);
		map.put("pageMake", pageMake);
		map.put("list", list);
		return map;
	}
	
	// 회원별 예매리스트
	public Map<String, Object> getUserTicketingList(Criteria cri){
		Map<String, Object> map	 = new HashMap<>();
		List<UserTicketingVO> list = admindao.getUserTicketingList(cri);
		int total = admindao.getUserTicketingTotal();
		PageMakerDTO pageMake = new PageMakerDTO(total, cri);
		map.put("pageMake", pageMake);
		map.put("list", list);
		return map;
	}

	// 공연번호 날짜로 회차정보 가지고오기
	public List<ShowingVO> getShowing(ShowingVO vo) {
		// System.out.println("getShowing Service()");
		return admindao.getShowing(vo);
	}

	// 회차 입력
	public int InsertShowing(ShowingVO vo) {
		System.out.println("InsertShowing Service()");
		return admindao.InsertShowing(vo);
	}

	// 회차 삭제
	public int DeleteShowing(String showingSq) {
		System.out.println("DeleteShowing Service()");
		return admindao.DeleteShowing(showingSq);
	}

	// 월별 공연일정
	public List<String> getShowingDay(int showSq) {
		System.out.println("getShowingDay Service()");
		List<String> list = admindao.getShowingDay(showSq);
		return list;
	}

	// 예매시작 상태변경
	public int showUpdateStat(ShowVO vo) {
		System.out.println("showUpdateStat Service()");
		return admindao.showUpdateStat(vo);
	}

	// 회차 날짜로 종류
	public int endShowing() {
		System.out.println("endShowing Service()");

		List<ShowingVO> showingSqList = admindao.getEndshowingSq();

		for (ShowingVO s : showingSqList) {

			admindao.endTicket(s.getShowingSq());
		}

		return admindao.endShowing();

	}

}