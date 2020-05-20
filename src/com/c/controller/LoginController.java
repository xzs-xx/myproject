package com.c.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.etity.User;
import com.c.service.UserService;


import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	@ResponseBody
	@RequestMapping("login.do")
	public String login(String username,String password,HttpServletResponse rep,HttpServletRequest req,HttpSession session){
		session.setAttribute("username", username);
		System.out.println(req.getServletContext().getRealPath("/"));
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
		return "childrenhomechange";
	}
	@RequestMapping("try.do")
	public String trydo(HttpServletRequest req) {
		ActiveXComponent ax = null;
        try {
            ax = new ActiveXComponent("Sapi.SpVoice");
            String text = "你好，很高兴见到你";
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
		return "qwq";
	}
}
