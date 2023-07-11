package com.yes24.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.ConcertHallVO;
import com.yes24.vo.SeatVO;

@Repository
public class ConcertHallDAO {

	@Autowired
	private SqlSession sqlSession;

	// -------------------- 공연장 등록
	public int insertConcertHall(ConcertHallVO vo) {
		System.out.println("insertConcertHall DAO");

		return sqlSession.insert("concerthall.insertConcertHall", vo);

	}

	// -------------------- 공연장 좌석 등록
	public int insertConcertHallSeat(Map<String, Object> seat) {
		System.out.println("insertConcertHallSeat DAO");

		return sqlSession.insert("concerthall.insertConcertHallSeat", seat);
	}

	// -------------------- 공연장 정보가져오기
	public ConcertHallVO getConcertHall(int no) {
		System.out.println("getConcertHall DAO()");

		return sqlSession.selectOne("concerthall.getConcertHall", no);
	}

	// -------------------- 공연장 리스트가져오기
	public List<ConcertHallVO> getConcertHallList(int no) {
		System.out.println("getConcertHallList DAO()");

		return sqlSession.selectList("concerthall.getConcertHallList");
	}
	
	// -------------------- 공연장 좌석정보가져오기
	public ConcertHallVO getConcertHallSeat(int no) {
		System.out.println("getConcertHallSeat DAO()");

		return sqlSession.selectOne("concerthall.getConcertHallSeat", no);
	}
	
	// -------------------- 공연좌석 리스트가지고오기
	public List<SeatVO> getConcertHallSeatList(int no) {
		System.out.println("getConcertHallList DAO()");

		return sqlSession.selectList("concerthall.getConcertHallSeatList", no);
	}

}
