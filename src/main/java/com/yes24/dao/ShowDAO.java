package com.yes24.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowVO;

@Repository
public class ShowDAO {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Map<String,Object> seatClass;

	// ------------------ 공연등록
	public int insertShow(ShowVO vo) {
		System.out.println("insertShow DAO()");

		return sqlSession.insert("show.insertShow", vo);
	}

	// ------------------ 공연좌석등급 등록
	public int insertSeatClass(Map<String, Object> seatClass) {
		System.out.println("insertSeatClass DAO()");

		return sqlSession.insert("show.insertSeatClass", seatClass);
	}

	// ------------------ 공연정보가져오기
	public ShowVO getShow(int no) {
		System.out.println("getShow DAO()");

		return sqlSession.selectOne("show.getShow", no);

	}

	// ------------------ 공연리스트가져오기
	public List<ShowVO> getShowList(int no) {
		System.out.println("getShowList DAO()");

		return sqlSession.selectList("show.getShowList",no);

	}
	
	// ------------------ 좌석클래스 리스트가져오기
	public List<SeatClassVO> getSeatClassList(int no) {
		System.out.println("getSeatClassList DAO()");
				
		return sqlSession.selectList("show.getSeatClassList",no);

	}
}
