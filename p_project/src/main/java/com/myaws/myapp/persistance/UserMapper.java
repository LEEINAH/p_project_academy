package com.myaws.myapp.persistance;

import com.myaws.myapp.domain.UserVo;

public interface UserMapper {
	
	public int userInsert(UserVo uv);
	
	public UserVo userLoginCheck(String userId);
	
}
