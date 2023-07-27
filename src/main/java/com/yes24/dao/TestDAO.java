package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.Criteria;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;

@Repository
public class TestDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//공연장 리스트 검색&페이징
	public List<ConcertHallVO> getConcertHallList(Criteria cri){
		System.out.println("getConcertHallList DAO()");
		List<ConcertHallVO> hallList = sqlSession.selectList("test.getConcertHallList", cri);
		return hallList;
	}
	
	//showStat로 공연정보 가져오기
	public List<ShowVO> getShowList(Criteria cri) {
		List<ShowVO> showList = sqlSession.selectList("test.adminShowList", cri);
		return showList;
	}
	
	//showSq로 공연정보 가져오기
	public ShowVO getShow(int no) {
		return sqlSession.selectOne("test.getShow", no);
	}
	
	//공연장이름 가지고 오기
	public ConcertHallVO getTicketingDetailHallName(ShowVO vo) {
		return sqlSession.selectOne("test.getTicketingDetailHallName", vo);
	}
	
	// 공연번호 날짜로 회차정보 가지고오기
	public List<ShowingVO> getShowing(ShowingVO vo) {
		List<ShowingVO> list = sqlSession.selectList("test.getShowing", vo); 
		return list;
	}
	//회차 입력
	public int InsertShowing(ShowingVO vo) {
		return sqlSession.insert("test.insertShowing", vo);
	}
	//회차 삭제
	public int DeleteShowing(String showingSq) {
		return sqlSession.delete("test.deleteShowing", showingSq);
	}
	// 월별 공연일정
	public List<String> getShowingDay(int showSq){
		List<String> list = sqlSession.selectList("test.getShowingDay", showSq);
		return list;
	}
	//예매시작 상태변경
	public int showUpdateStat(ShowVO vo) {
		return sqlSession.update("test.showUpdateStat", vo);
	}
	//상태별 공연갯수 가져오기
	public int getTotal(Criteria cri) {
		int num = sqlSession.selectOne("test.getShowTotal", cri);
		return num;
	}
	//공연장 검색후  가져오기
	public int getConcertHallTotal(Criteria cri) {
		return sqlSession.selectOne("test.getConcertHallTotal", cri);
	}
	
	
}
