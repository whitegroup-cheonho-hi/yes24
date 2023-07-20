package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.MyTicketingVO;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 나의 예매 내역 가져오기
	public List<MyTicketingVO> myTicketingList(int no) {
		System.out.println("myTicketingList DAO()");

		return sqlSession.selectList("mypage.myTicketingList", no);

	}
}
