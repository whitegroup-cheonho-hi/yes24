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
		System.out.println("loginUser Service()");

		return userDAO.loginUser( vo);
	}
	
	// -------------------- 회원정보가져오기
	public UserVO getUser(UserVO vo) {
		System.out.println("getUser Service()");

		return userDAO.getUser( vo);
	}
	
	// -------------------- 회원정보수정
		public int updateUser(UserVO vo) {
			System.out.println("updateUser Service()");

			return userDAO.updateUser(vo);
		}

}
