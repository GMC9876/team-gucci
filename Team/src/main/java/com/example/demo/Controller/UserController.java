package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo.dao.UserDAO;
import com.example.demo.Service.UserSVC;
import com.example.demo.Vo.UserVO;

@SessionAttributes("uid")
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private UserSVC svc;
	
	
	
	@PostMapping("/insertuser")
	@ResponseBody
	public String insertUser(UserVO user) {
		System.out.println(user);
		return String.format("{\"insertuser\":%b}", dao.insertUser(user));
	}
	
	@PostMapping("/login")
	@ResponseBody
	public String login(UserVO vo, Model model) {
		
		boolean ok = svc.login(vo);
		if(ok) {
			model.addAttribute("uid",vo.getUid());
		}
		return String.format("{\"ok\":%b}", ok);
	}
	
	@GetMapping("/logout")
	@ResponseBody
	public boolean logout(SessionStatus status) {
		status.setComplete(); // 세션에 저장된 모든 데이터를 삭제함
		return status.isComplete();
	}
	
	@PostMapping("/update")
	@ResponseBody
	public String updateUser(UserVO user, Model model) {
		return String.format("{\"update\":%b}", svc.updateUser(user));
	}
	
}
