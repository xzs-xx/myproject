package com.c.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Sharing_centerController {
	@RequestMapping("sharing_center.do")
	public String Sharing_center(HttpServletResponse rep,HttpServletRequest req) {
		return "sharing_center";
	}
}
