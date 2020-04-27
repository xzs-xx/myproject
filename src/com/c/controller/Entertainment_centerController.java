package com.c.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	@RequestMapping("entertainment_center_music.do")
	public String entertainment_center_music(String musicsrc,String musicname,String musiclrc,HttpServletRequest req,HttpSession session) {
		session.setAttribute("musicsrc",musicsrc);
		session.setAttribute("musicname",musicname);
		session.setAttribute("musiclrc",musiclrc);
		return "entertainment_center_music_go.do";
	}
	@RequestMapping("entertainment_center_music_go.do")
	public String entertainment_center_music_go(HttpServletRequest req,HttpSession session) {
		return "entertainment_center_music";
	}
	
	@ResponseBody
	@RequestMapping("entertainment_center_story.do")
	public String entertainment_center_story(String storysrc,String storyname,HttpServletRequest req,HttpSession session) {
		session.setAttribute("storysrc",storysrc);
		session.setAttribute("storyname",storyname);
		return "entertainment_center_story_go.do";
	}
	@RequestMapping("entertainment_center_story_go.do")
	public String entertainment_center_story_go(HttpServletRequest req,HttpSession session) {
		return "entertainment_center_story";
	}
	
	
	@ResponseBody
	@RequestMapping("entertainment_center_video.do")
	public String entertainment_center_video(String videosrc,String videotitle,HttpServletRequest req,HttpSession session) {
		session.setAttribute("videosrc",videosrc);
		session.setAttribute("videotitle",videotitle);
		return "entertainment_center_video_go.do";
	}
	@RequestMapping("entertainment_center_video_go.do")
	public String entertainment_center_video_go(HttpServletRequest req,HttpSession session) {
		return "entertainment_center_video";
	}
}
