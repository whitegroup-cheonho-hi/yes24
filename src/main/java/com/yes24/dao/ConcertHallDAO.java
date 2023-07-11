package com.yes24.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.ConcertHallVO;

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

}
