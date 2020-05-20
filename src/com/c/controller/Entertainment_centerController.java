package com.c.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.service.MusicService;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

@Controller
public class Entertainment_centerController {
	@Autowired
	private MusicService musicService;
	@RequestMapping("entertainment_center.do")
	public String entertainment_center(HttpServletResponse rep,HttpServletRequest req) {
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
		req.setAttribute("musics", musicService.findMusic());
		return "entertainment_center_music";
	}
	
	@ResponseBody
	@RequestMapping("entertainment_center_story.do")
	public String entertainment_center_story(String storytext,HttpServletRequest req,HttpSession session) {
		ActiveXComponent ax = null;
        try {
            ax = new ActiveXComponent("Sapi.SpVoice");
            String text = storytext;
            // 运行时输出语音内容
            Dispatch spVoice = ax.getObject();
            // 音量 0-100
            ax.setProperty("Volume", new Variant(100));
            // 语音朗读速度 -10 到 +10
            ax.setProperty("Rate", new Variant(-2));
            // 执行朗读
            Dispatch.call(spVoice, "Speak", new Variant(text));
            // 下面是构建文件流把生成语音文件
            ax = new ActiveXComponent("Sapi.SpFileStream");
            Dispatch spFileStream = ax.getObject();
            ax = new ActiveXComponent("Sapi.SpAudioFormat");
            Dispatch spAudioFormat = ax.getObject();
            // 设置音频流格式
            Dispatch.put(spAudioFormat, "Type", new Variant(22));
            // 设置文件输出流格式
            Dispatch.putRef(spFileStream, "Format", spAudioFormat);
            // 调用输出 文件流打开方法，创建一个.wav文件
            Dispatch.call(spFileStream, "Open", new Variant("./text.wav"), new Variant(3), new Variant(true));
            // 设置声音对象的音频输出流为输出文件对象
            Dispatch.putRef(spVoice, "AudioOutputStream", spFileStream);
            // 设置音量 0到100
            Dispatch.put(spVoice, "Volume", new Variant(100));
            // 设置朗读速度
            Dispatch.put(spVoice, "Rate", new Variant(-2));
            // 开始朗读
            Dispatch.call(spVoice, "Speak", new Variant(text));
            // 关闭输出文件
            Dispatch.call(spFileStream, "Close");
            Dispatch.putRef(spVoice, "AudioOutputStream", null);
            spAudioFormat.safeRelease();
            spFileStream.safeRelease();
            spVoice.safeRelease();
            ax.safeRelease();

        } catch (Exception e) {
            e.printStackTrace();
        }
		return "开始阅读";
	}
	@RequestMapping("entertainment_center_story_go.do")
	public String entertainment_center_story_go(HttpServletRequest req,HttpSession session) {
		req.setAttribute("storys", musicService.findStory());
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
		req.setAttribute("videos", musicService.findVideo());
		return "entertainment_center_video";
	}
}
