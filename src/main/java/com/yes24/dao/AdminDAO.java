package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.Criteria;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;
import com.yes24.vo.TransferBoardVO;
import com.yes24.vo.UserTicketingVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	// 공연장 리스트 검색&페이징
	public List<ConcertHallVO> getConcertHallList(Criteria cri) {
		System.out.println("getConcertHallList DAO()");
		List<ConcertHallVO> hallList = sqlSession.selectList("admin.getConcertHallList", cri);
		return hallList;
	}

	// showStat로 공연정보 가져오기
	public List<ShowVO> getShowList(Criteria cri) {
		List<ShowVO> showList = sqlSession.selectList("admin.adminShowList", cri);
		return showList;
	}

	// showSq로 공연정보 가져오기
	public ShowVO getShow(int no) {
		return sqlSession.selectOne("admin.getShow", no);
	}

	// 공연장이름 가지고 오기
	public ConcertHallVO getTicketingDetailHallName(ShowVO vo) {
		System.out.println(vo);
		return sqlSession.selectOne("admin.getTicketingDetailHallName", vo);
	}

	// 공연번호 날짜로 회차정보 가지고오기
	public List<ShowingVO> getShowing(ShowingVO vo) {
		List<ShowingVO> list = sqlSession.selectList("admin.getShowing", vo);
		return list;
	}

	// 회차 입력
	public int InsertShowing(ShowingVO vo) {
		return sqlSession.insert("admin.insertShowing", vo);
	}

	// 회차 삭제
	public int DeleteShowing(String showingSq) {
		return sqlSession.delete("admin.deleteShowing", showingSq);
	}

	// 월별 공연일정
	public List<String> getShowingDay(int showSq) {
		List<String> list = sqlSession.selectList("admin.getShowingDay", showSq);
		return list;
	}

	// 예매시작 상태변경
	public int showUpdateStat(ShowVO vo) {
		return sqlSession.update("admin.showUpdateStat", vo);
	}

	// 상태별 공연갯수 가져오기
	public int getTotal(Criteria cri) {
		int num = sqlSession.selectOne("admin.getShowTotal", cri);
		return num;
	}

	// 공연장수 검색후 가져오기
	public int getConcertHallTotal(Criteria cri) {
		return sqlSession.selectOne("admin.getConcertHallTotal", cri);
	}

	// 양도리스트수 가져오기
	public int getTransferTotal(Criteria cri) {
		int total = sqlSession.selectOne("admin.getTransferTotal", cri);
		return total;
	}

	// 양도리스트 가져오기
	public List<TransferBoardVO> getTransferList(Criteria cri) {
		List<TransferBoardVO> list = sqlSession.selectList("admin.getTransferList", cri);
		return list;
	}
	
	// 회원별예매리스트수 가져오기
	public int getUserTicketingTotal() {
		return sqlSession.selectOne("admin.getUserTicketingTotal");
	}
	
	//회원별 예매리스트
	public List<UserTicketingVO> getUserTicketingList(Criteria cri){
		List<UserTicketingVO> list = sqlSession.selectList("admin.getUserTicketingList", cri);
		return list;
	}

	// 회차 날짜로 종료
	public int endShowing() {
		System.out.println("endShowing DAO()");

		return sqlSession.update("admin.endShowing");

	}

	// 종료된 회차 시퀀스 가져오기 리스트로
	public List<ShowingVO> getEndshowingSq() {
		System.out.println("getEndshowingSq DAO()");

		return sqlSession.selectList("admin.getEndShowingSq");
	}

	// 종료된 회차 시퀀스로 티켓 상태변경
	public int endTicket(int no) {
		System.out.println("endTicket DAO()");

		return sqlSession.update("admin.endTicket", no);
	}

}
