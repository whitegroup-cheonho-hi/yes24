package com.yes24.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.Criteria;
import com.yes24.vo.SeatClassListVO;
import com.yes24.vo.SeatClassVO;
import com.yes24.vo.ShowSeatVO;
import com.yes24.vo.ShowVO;
import com.yes24.vo.ShowingVO;

@Repository
public class ShowDAO {

	@Autowired
	private SqlSession sqlSession;

	// ------------------ 공연등록
	public int insertShow(ShowVO vo) {
		System.out.println("insertShow DAO()");

		return sqlSession.insert("show.insertShow", vo);
	}

	// ------------------ 공연수정
	public int updateShow(ShowVO vo) {
		System.out.println("updateShow DAO()");

		return sqlSession.update("show.updateShow", vo);
	}

	// ------------------ 공연좌석등급 등록
	public int insertSeatClass(SeatClassListVO vo) {
		System.out.println("insertSeatClass DAO()");

		return sqlSession.insert("show.insertSeatClass", vo);
	}

	// ------------------ 공연좌석 등록
	public int insertShowSeat(ShowSeatVO vo) {
		System.out.println("insertShowSeat DAO()");

		return sqlSession.insert("show.insertShowSeat", vo);
	}

	// ------------------ 공연좌석등급 수정
	public int updateSeatClass(SeatClassListVO vo) {
		System.out.println("updateSeatClass DAO()");

		return sqlSession.update("show.updateSeatClass", vo);
	}

	// ------------------ 공연정보 가져오기
	public ShowVO getShow(int no) {
		System.out.println("getShow DAO()");

		return sqlSession.selectOne("show.getShow", no);

	}

	// ------------------ 공연장 시퀀스로 공연 시퀀스 가지고오기
	public ShowVO getShowSq(int no) {
		System.out.println("getShowSq DAO()");

		return sqlSession.selectOne("show.getShowSq", no);

	}

	// ------------------ 공연리스트가져오기
	public List<ShowVO> getShowList(int no) {
		System.out.println("getShowList DAO()");

		return sqlSession.selectList("show.getShowList", no);

	}

	// ------------------ 티케팅예정작
	public List<ShowVO> getWhatsHot() {
		System.out.println("getWhatsHot DAO()");

		return sqlSession.selectList("show.getWhatsHot");

	}

	// ------------------ 티케팅예정작
	public List<ShowVO> getTicketingScheduled() {
		System.out.println("getTicketingScheduled DAO()");

		return sqlSession.selectList("show.getTicketingScheduled");

	}

	// ------------------ 공연리스트가져오기
	public List<ShowVO> getShowList(Criteria cri) {
		System.out.println("getShowList DAO()");

		return sqlSession.selectList("show.getShowListPaging", cri);

	}

	// -------------------- 양도게시글 가져오기
	public int getTotal(Criteria cri) {
		System.out.println("getTotal DAO()");

		return sqlSession.selectOne("show.getTotal", cri);
	}

	// ------------------ 좌석클래스 리스트가져오기
	public List<SeatClassVO> getSeatClassList(int no) {
		System.out.println("getSeatClassList DAO()");

		return sqlSession.selectList("show.getSeatClassList", no);

	}

	// -------------------- 공연좌석삭제
	public int deleteShowSeat(int no) {
		System.out.println("deleteShowSeat DAO()");

		return sqlSession.delete("show.deleteShowSeat", no);
	}

	// -------------- 공연이름으로 검색
	public List<ShowVO> getShowName(String showName) {
		System.out.println("getShowName DAO()");

		return sqlSession.selectList("show.getShowName", showName);
	}

	// -----------------------------------------------------------------------------------
	public ShowVO getShow2(int no) {
		System.out.println("getShow DAO()");

		return sqlSession.selectOne("show.getShow2", no);

	}
	// ----------------------------------------------------------------------------------------
}
