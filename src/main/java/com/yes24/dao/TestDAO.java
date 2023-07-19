package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;

@Repository
public class TestDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ShowVO getShow(int no) {
		//System.out.println("getShow DAO()");
		return sqlSession.selectOne("test.getShow", no);

	}
	
	// 공연번호 날짜로 회차정보 가지고오기
	public List<ShowingVO> getShowing(ShowingVO vo) {
		System.out.println("getShowing DAO()");
		List<ShowingVO> list = sqlSession.selectList("test.getShowing", vo); 
		System.out.println(list);
		return list;
	}
	//회차 입력
	public int InsertShowing(ShowingVO vo) {
		System.out.println("InsertShowing DAO()");
		return sqlSession.insert("test.insertShowing", vo);
	}
	//회차 삭제
	public int DeleteShowing(String showingSq) {
		System.out.println("InsertShowing DAO()");
		return sqlSession.delete("test.deleteShowing", showingSq);
	}
	// 월별 공연일정
	public List<String> getShowingDay(int showSq){
		System.out.println("getShowingDay DAO()");
		List<String> list = sqlSession.selectList("test.getShowingDay", showSq);
		return list;
	}
	
}
