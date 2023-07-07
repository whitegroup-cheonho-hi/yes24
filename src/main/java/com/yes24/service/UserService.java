package com.yes24.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yes24.dao.UserDAO;
import com.yes24.vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private UserVO userVO;

	// -------------------- 회원가입
	public int insertUser(UserVO vo) {
		System.out.println("insertUser Service()");

		return userDAO.insertUser(vo);
	}

	// -------------------- 로그인
	public UserVO loginUser(UserVO vo) {
		System.out.println("loginUser Service()");

		return userDAO.loginUser(vo);
	}

	// -------------------- 회원정보가져오기
	public UserVO getUser(UserVO vo) {
		System.out.println("getUser Service()");

		return userDAO.getUser(vo);
	}

	// -------------------- 회원정보수정
	public int modifyUser(UserVO vo) {
		System.out.println("modifyUser Service()");

		return userDAO.updateUser(vo);
	}

	// -------------------- 회원탈퇴(회원 상태만 변경한다.)
	public int deleteUser(int no) {
		System.out.println("deleteUser Service()");

		return userDAO.deleteUser(no);
	}

	// -------------------- 아이디 체크
	public boolean idCheck(String id) {
		System.out.println("idCheck Service()");

		boolean result = false;

		userVO = userDAO.idCheck(id);
	
		if (userVO == null) {

			result = true;
		}
		return result;
	}

}
