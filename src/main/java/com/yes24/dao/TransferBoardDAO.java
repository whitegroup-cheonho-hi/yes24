package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.MyTicketingVO;
import com.yes24.vo.TransferBoardVO;

@Repository
public class TransferBoardDAO {

	@Autowired
	private SqlSession sqlSession;

	// ------------------- 양도게시판 등록
	public int insertTransferboard(TransferBoardVO vo) {
		System.out.println("insertTransferboard DAO()");

		return sqlSession.insert("transferboard.insertTransferboard", vo);
	}

	// -------------------- 양도 게시글 삭제
	public int deleteTransferboard(int no) {
		System.out.println("deleteTransferboard DAO()");

		return sqlSession.delete("transferboard.deleteTransferboard", no);
	}

	// -------------------- 양도게시글 리스트 가져오기
	public List<TransferBoardVO> getTransferboardList() {
		System.out.println("getTransferboardList DAO()");

		return sqlSession.selectList("transferboard.getTransferboardList");
	}

}
