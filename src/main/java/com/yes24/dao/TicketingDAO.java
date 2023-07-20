package com.yes24.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.TicketingVO;
import com.yes24.vo.UserVO;

@Repository
public class TicketingDAO {

	@Autowired
	private SqlSession sqlSession;

	// -------------- 예매등록
	public void insertTicketing(TicketingVO vo) {
		System.out.println("insertTicketing DAO()");

		sqlSession.insert("ticketing.insertTicketing", vo);

	}

	// -------------- 예매등록
	public int deleteTicketing(UserVO vo) {
		System.out.println("deleteTicketing DAO()");

		return sqlSession.insert("ticketing.deleteTicketing", vo);
	}
}
