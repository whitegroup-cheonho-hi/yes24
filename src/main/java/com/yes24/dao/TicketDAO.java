package com.yes24.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDAO {

	@Autowired
	private SqlSession sqlSession;

	// ------------ 티켓 양도상태로 변경
	public int updateTicket(int no) {
		System.out.println("updateTicket DAO()");

		return sqlSession.update("ticket.insertTransferTicket", no);
	}

	// ----------- 티켓 양도취소
	public int cancelTransferTicket(int no) {
		System.out.println("cancelTransferTicket DAO()");

		return sqlSession.update("ticket.cancelTransferTicket", no);

	}
}
