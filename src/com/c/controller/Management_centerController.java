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
		session.setAttribute("managementdiarys", diary);
		if(session.getAttribute("diaryindex") == null)
			session.setAttribute("diaryindex", -1);
		return "management_center";
	}
	
	@ResponseBody
	@RequestMapping("management_nextpage.do")
	public String[] management_nextpage(int diaryindex,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		String[] testNext = new String[4];
		List<Diary> diary = (List<Diary>) session.getAttribute("managementdiarys");
		if(diaryindex>=diary.size() || diaryindex < 0) {
			testNext[0] = "没有了";
		}else {
			if(session.getAttribute("diaryindex") != null) {
				session.removeAttribute("diaryindex");
			}
			session.setAttribute("diaryindex", diaryindex);
			testNext[0] ="翻到下一页";
			testNext[1] = diary.get(diaryindex).getTitle();
			testNext[2] = diary.get(diaryindex).getText().replace("\n", "<br>");
			testNext[3] = ""+diary.get(diaryindex).getStatu();
		}
		return testNext;
	}

	@ResponseBody
	@RequestMapping("management_diarystatu.do")
	public String management_diarystatu(String statu,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		List<Diary> diary = (List<Diary>) session.getAttribute("managementdiarys");
		int lstatu = 0;
		int diaryindex = (int) session.getAttribute("diaryindex");
		if(statu.equals("0"))lstatu = 1;
		diary.get(diaryindex).setStatu(lstatu);
		managementService.updatediarystatu(diary.get(diaryindex).getId(), lstatu);
		return "";
	}
}
