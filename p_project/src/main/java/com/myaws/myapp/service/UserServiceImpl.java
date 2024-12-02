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
	  	this.um = sqlSession.getMapper(UserMapper.class); // ���� ������ �ִ��� Ȯ���ϱ� ���� class�� ����
												           // mybatis�� ���� ���� mapper�� ����
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
