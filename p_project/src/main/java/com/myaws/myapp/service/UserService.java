package com.myaws.myapp.service;

import com.myaws.myapp.domain.UserVo;

public interface UserService {
	
	public int userInsert(UserVo uv);

	public UserVo userLoginCheck(String userId);
}
