package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.ShowingVO;

@Repository
public class ShowingDAO {

	@Autowired
	private SqlSession sqlSession;

	// 공연번호 날짜로 회차정보 가지고오기
	public List<ShowingVO> getShowing(ShowingVO vo) {
		System.out.println("getShowing DAO");

		return sqlSession.selectList("showing.getShowing", vo);
	}
}
