package com.c.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.etity.Diary;
import com.c.service.ManagementService;

@Controller
public class Management_centerController {
	@Autowired
	private ManagementService managementService;
	@RequestMapping("management_center.do")
	public String management_center(HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		List<Diary> diary = managementService.findUserDiary((String)session.getAttribute("username"));
		req.setAttribute("managementdiarys", diary);
		return "management_center";
	}
	
	

	@ResponseBody
	@RequestMapping("management_diarystatu.do")
	public String management_diarystatu(String id,int statu,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		statu = 
		managementService.updatediarystatu(id, statu);
		return "";
	}
}
