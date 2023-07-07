package com.yes24.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShowingDAO {

	@Autowired
	private SqlSession sqlSession;
}
