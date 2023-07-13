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
	public List<ConcertHallVO> getConcertHallList() {
		System.out.println("getConcertHallList DAO()");

		return sqlSession.selectList("concerthall.getConcertHallList");
	}

	// -------------------- 공연장 좌석정보가져오기
	public ConcertHallVO getConcertHallSeat(SeatVO vo) {
		System.out.println("getConcertHallSeat DAO()");

		return sqlSession.selectOne("concerthall.getConcertHallSeat", vo);
	}

	// -------------------- 공연좌석 리스트가지고오기
	public List<SeatVO> getConcertHallSeatList(int no) {
		System.out.println("getConcertHallList DAO()");
		
		return sqlSession.selectList("concerthall.getConcertHallSeatList", no);
	}

	// -------------------- 극장정보 업데이트
	public int updateConcertHall(ConcertHallVO vo) {
		System.out.println("updateConcertHall DAO()");

		return sqlSession.update("concerthall.updateConcertHall", vo);
	}

	// -------------------- 좌석삭제
	public int deleteConcertHallSeat(int no) {
		System.out.println("deleteConcertHallSeat DAO()");

		return sqlSession.delete("concerthall.deleteConcertHallSeat", no);
	}

}
