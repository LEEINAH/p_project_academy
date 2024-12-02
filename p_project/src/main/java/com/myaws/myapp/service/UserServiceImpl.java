package com.myaws.myapp.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myaws.myapp.domain.UserVo;
import com.myaws.myapp.persistance.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	private UserMapper um;

	@Autowired
	public UserServiceImpl(SqlSession sqlSession) {
	  	this.um = sqlSession.getMapper(UserMapper.class); // 실행 파일이 있는지 확인하기 위해 class를 붙임
												           // mybatis를 쓰기 위해 mapper와 연동
	}
	
	@Override
	public int userInsert(UserVo uv) {
		
		int value = um.userInsert(uv);
		
		return value;
	}
	
	public UserVo userLoginCheck(String userId) {
		
		UserVo uv = um.userLoginCheck(userId);
		System.out.println("impl uv =====> " + uv);

		return uv;
	}
}
