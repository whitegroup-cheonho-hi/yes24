package com.yes24.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yes24.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession sqlSession;

	// -------------------- 회원가입
	public int insertUser(UserVO vo) {
		System.out.println("insertUser DAO()");

		return sqlSession.insert("user.insertUser", vo);
	}

	// -------------------- 로그인
	public UserVO loginUser(UserVO vo) {
		System.out.println("loginUser DAO()");

		return sqlSession.selectOne("user.loginUser", vo);
	}
	
	// -------------------- 회원정보가져오기
	public UserVO getUser(UserVO vo) {
		System.out.println("getUser DAO()");

		return sqlSession.selectOne("user.getUser", vo);
	}
	
	// -------------------- 회원정보수정
	public int updateUser(UserVO vo) {
		System.out.println("updateUser DAO()");

		return sqlSession.update("user.updateUser", vo);
	}
	
	
}
