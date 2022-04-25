package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo.Service.UserSVC;
import com.example.demo.Vo.UserVO;
import com.example.demo.dao.UserDAO;

@SessionAttributes("uid")
@Controller
@RequestMapping("/page")
public class PageController {
	
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private UserSVC svc;

	@GetMapping("/login")
	public String loginPage() {
		if(svc.isLogin()) {
			return "index";
		}else {
			return "login";
		}
	}
	
	@GetMapping("/adduser")
	public String addUser() {
		return "register";
	}
	
	@GetMapping("/index")
	public String indexPage(Model model) {
		if(svc.isLogin()) {
			return "index";
		}else {
			model.addAttribute("msg","로그인 후에 사용해주세요");
			return "login";
		}
	}
	
	@GetMapping("/update")
	public String updatePage(Model model) {
		String uid = (String) model.getAttribute("uid");
		if(svc.isLogin()) {
			UserVO user = dao.checkById(uid);
			model.addAttribute("user",user);
			return "password";
		}else {
			model.addAttribute("msg","로그인 후에 사용해주세요");
			return "login";
		}
	}
}
