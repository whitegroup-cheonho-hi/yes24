package com.yes24.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.Criteria;
import com.yes24.vo.TransferBoardVO;

@Repository
public class TransferBoardDAO {

	@Autowired
	private SqlSession sqlSession;

	// ------------------- 양도게시판 등록
	public int insertTransferBoard(TransferBoardVO vo) {
		System.out.println("insertTransferBoard DAO()");

		return sqlSession.insert("transferboard.insertTransferBoard", vo);
	}

	// ------------------- 양도완료후 게시판 업데이트
	public int updateTransferBoard(TransferBoardVO vo) {
		System.out.println("updateTransferBoard DAO()");

		return sqlSession.update("transferboard.updateTransferBoard", vo);
	}

	// -------------------- 양도 게시글 삭제
	public int deleteTransferBoard(int no) {
		System.out.println("deleteTransferBoard DAO()");

		return sqlSession.delete("transferboard.deleteTransferBoard", no);
	}

	// -------------------- 양도게시글 리스트 가져오기
	public List<TransferBoardVO> getTransferBoardList(Criteria cri) {
		System.out.println("getTransferBoardList DAO()");

		return sqlSession.selectList("transferboard.getTransferBoardList", cri);
	}

	// -------------------- 양도게시글 가져오기
	public TransferBoardVO getTransferBoard(int no) {
		System.out.println("getTransferBoard DAO()");

		return sqlSession.selectOne("transferboard.getTransferBoard", no);
	}

	// -------------------- 양도게시글 가져오기
	public int getTotal(Criteria cri) {
		System.out.println("getTotal DAO()");

		return sqlSession.selectOne("transferboard.getTotal", cri);
	}

	// -------------------- // 임박 5개 가져오기
	public List<TransferBoardVO> getImminentShowing() {
		System.out.println("getImminentShowing DAO()");

		return sqlSession.selectList("transferboard.getImminentShowing");
	}
}
