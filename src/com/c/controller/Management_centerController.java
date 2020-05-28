package com.c.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.etity.*;
import com.c.service.ManagementService;

@Controller
public class Management_centerController {
	@Autowired
	private ManagementService managementService;
	@RequestMapping("management_center.do")
	public String management_center(HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		req.setAttribute("userdiarys", managementService.findUserDiary((String)session.getAttribute("username")));
		req.setAttribute("compositions", managementService.findUserComposition((String)session.getAttribute("username")));
		req.setAttribute("shareimages", managementService.findUserShareImage((String)session.getAttribute("username")));
		return "management_center";
	}
	
	@ResponseBody
	@RequestMapping("management_diary.do")
	public List<Diary> management_diary(HttpServletResponse rep,HttpServletRequest req,HttpSession session){
		return  managementService.findUserDiary((String)session.getAttribute("username"));
	}

	@ResponseBody
	@RequestMapping("management_composition.do")
	public List<Composition> management_composition(HttpServletResponse rep,HttpServletRequest req,HttpSession session){
		return  managementService.findUserComposition((String)session.getAttribute("username"));
	}
	

	@ResponseBody
	@RequestMapping("management_shareimage.do")
	public List<ShareImage> management_shareimage(HttpServletResponse rep,HttpServletRequest req,HttpSession session){
		return  managementService.findUserShareImage((String)session.getAttribute("username"));
	}
	
	@ResponseBody
	@RequestMapping("management_diarystatu.do")
	public String management_diarystatu(String id,int statu,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		managementService.updatediarystatu(id, statu);
		return "";
	}
	
	@ResponseBody
	@RequestMapping("management_compositionstatu.do")
	public String management_compositionstatu(String id,int statu,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		managementService.updatecompositionstatu(id, statu);
		return "";
	}
	
	@ResponseBody
	@RequestMapping("management_shareimagestatu.do")
	public String management_shareimagestatu(String id,int statu,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		managementService.updatecompositionstatu(id, statu);
		return "";
	}
}
