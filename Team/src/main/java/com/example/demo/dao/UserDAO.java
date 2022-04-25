package com.example.demo.dao;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Repository;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.demo.mapper.usermapper;
import com.example.demo.Vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private usermapper UM;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	
	public int insertUser(UserVO user) {
		String encodePassword = passwordEncoder.encode(user.getPwd());
        user.setPwd(encodePassword);
		return UM.insertUser(user);
	}
	
	public UserVO login(UserVO user) {
		 UserVO U = UM.checkById(user.getUid());
		 boolean check = passwordEncoder.matches(user.getPwd(), U.getPwd());
		 if(check) {
			 return U;
		 }else {
			 return null;
		 }
		 
	   }
	
	public UserVO checkById(String uid) {
		return UM.checkById(uid);
	}
	
	public int updateUser(UserVO user) {
		String encodePassword = passwordEncoder.encode(user.getPwd());
		user.setPwd(encodePassword);
		return UM.updateUser(user);
		
	}
}
