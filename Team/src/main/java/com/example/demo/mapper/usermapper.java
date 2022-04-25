package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.Vo.UserVO;

@Mapper
public interface usermapper {
	int insertUser(UserVO user);
	UserVO getUser(UserVO user);
	UserVO checkById(String uid);
	int updateUser(UserVO user);
	
}
