package com.c.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.c.service.MusicService;

@Controller
public class Entertainment_centerController {
	@Autowired
	private MusicService musicService;
	@RequestMapping("entertainment_center.do")
	public String entertainment_center(HttpServletResponse rep,HttpServletRequest req) {
		req.setAttribute("musics", musicService.findMusic());
		req.setAttribute("storys", musicService.findStory());
		req.setAttribute("videos", musicService.findVideo());
		return "entertainment_center";
	}
}
