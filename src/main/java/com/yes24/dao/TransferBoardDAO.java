package com.yes24.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.TransferBoardVO;

@Repository
public class TransferBoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	// ------------------- 양도게시판 등록
	public int insertTransferboard(TransferBoardVO vo) {
		System.out.println("insertTransferboard DAO()");
		
		return sqlSession.insert("transferboard.insertTransferboard",vo);
	}
	
}
