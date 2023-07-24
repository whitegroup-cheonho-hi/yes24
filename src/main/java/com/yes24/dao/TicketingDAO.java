package com.yes24.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.ShowingSeatVO;
import com.yes24.vo.TicketVO;
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

	// -------------- 예매삭제
	public int deleteTicketing(UserVO vo) {
		System.out.println("deleteTicketing DAO()");

		return sqlSession.delete("ticketing.deleteTicketing", vo);
	}

	// -------------- 티켓등록
	public int insertTicket(TicketVO vo) {
		System.out.println("insertTicket DAO()");

		return sqlSession.insert("ticketing.insertTicket", vo);
	}

	// -------------- 양도후 티켓등록
	public int buyTransferTicket(TicketVO vo) {
		System.out.println("buyTransferTicket DAO()");
		
		return sqlSession.insert("ticketing.buyTransferTicket", vo);
	
	}

	// -------------- 회차 좌석 등록
	public int insertShowingSeat(ShowingSeatVO vo) {
		System.out.println("insertShowingSeat DAO()");

		return sqlSession.insert("ticketing.insertShowingSeat", vo);
	}

}
