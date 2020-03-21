package com.c.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.etity.User;
import com.c.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	@ResponseBody
	@RequestMapping("login.do")
	public String login(String username,String password,HttpServletResponse rep,HttpServletRequest req,HttpSession session){
		session.setAttribute("username", username);
		return userService.findUser(username,password);
	}
	@ResponseBody
	@RequestMapping("apply.do")
	public String apply(String username,String password,String email,String tel,String portrait,String pos,
			HttpServletResponse rep,HttpServletRequest req,HttpSession session){
		User user = new User();
		//Date date = new Date();
		user.setId(10);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setTel(tel);
		user.setPos(pos);
		user.setPortrait("");
		System.out.print(pos);
		return userService.addApplyUser(user);
	}
	
	@RequestMapping("childrenhome.do")
	public String loginchildrenhome(HttpServletResponse rep,HttpServletRequest req) {
		//HttpSession session = req.getSession();
		return "childrenhome";
	}
}
