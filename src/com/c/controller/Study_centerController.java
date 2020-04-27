package com.c.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.c.etity.*;
import com.c.service.StudyService;

@Controller
public class Study_centerController {
	@Autowired
	private StudyService studyService;
	@RequestMapping("study_center.do")
	public String Study_center(HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		List<Book> books = studyService.findBook();
		req.setAttribute("books", books);
		return "study_center";
	}
}
