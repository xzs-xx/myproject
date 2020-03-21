package com.c.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.etity.Diary;
import com.c.service.SharingService;

@Controller
public class Sharing_centerController {
	@Autowired
	private SharingService sharingService;
	@RequestMapping("sharing_center.do")
	public String Sharing_center(HttpServletResponse rep,HttpServletRequest req) {
		return "sharing_center";
	}
	@ResponseBody
	@RequestMapping("adddiary.do")
	public String addDiary(String title,String text,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		Diary diary =new Diary();
		Date date = new Date();
		diary.setId(""+date.getTime());
		diary.setUsername((String) session.getAttribute("username"));
		diary.setTitle(title);;
		diary.setText(text);
		diary.setTime(date);
		diary.setStatu(0);
		return sharingService.adddiary(diary);
	}
}
