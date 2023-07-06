package com.yes24.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.UserDAO;
import com.yes24.vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;

	// -------------------- 회원가입
	public int insertUser(UserVO vo) {
		System.out.println("insertUser Service()");

		return userDAO.insertUser(vo);
	}

	// -------------------- 로그인
	public UserVO loginUser(UserVO vo) {
		System.out.println("loginUser DAO()");

		return userDAO.loginUser( vo);
	}

}
