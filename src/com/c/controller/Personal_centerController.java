package com.c.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.etity.*;
import com.c.service.PersonalService;

import net.sf.json.JSONArray;

@Controller
public class Personal_centerController {
	@Autowired
	private PersonalService personalService;
	@RequestMapping("personal_center.do")
	public String personal_center(HttpServletResponse rep,HttpServletRequest req,HttpSession session){
		String username = (String)session.getAttribute("username");
		List<Collection> usercollection = personalService.findUserCollection(username);
		List<Fans> fans = personalService.findFans(username);
		List<Fans> befans = personalService.findBeFans(username);
		session.setAttribute("usercollection", usercollection);
		int i = 0;
		int collectiondiarysize = 0;
		for(i = 0;i < usercollection.size();i++) {
			if(usercollection.get(i).getCollectiontype().equals("diary")) collectiondiarysize++;
		}
		req.setAttribute("usercollectionsize", usercollection.size());
		req.setAttribute("collectiondiarysize", collectiondiarysize);
		req.setAttribute("fans", fans);
		req.setAttribute("befans", befans);
		req.setAttribute("fanssize", fans.size());
		req.setAttribute("befanssize", befans.size());
		return "personal_center";
	}
	@ResponseBody
	@RequestMapping("seeusercollection.do")
	public String[] seeusercollection(int collectionindex, HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		String result[] = new String[6];
		result[0] = "没有了";
		List<Collection> usercollection = (List<Collection>) session.getAttribute("usercollection");
		if(collectionindex>=0&&collectionindex<usercollection.size()) {
			if(usercollection.get(collectionindex).getCollectiontype().equals("diary")) {
				Diary diary = personalService.findCollectionDiary(usercollection.get(collectionindex).getCollectionid());
				if(diary != null) {
					result[0] = "成功";
					result[1] = diary.getTitle();
					result[2] = diary.getText().replace("\n", "<br>");
					result[3] = diary.getUsername();
					result[4] = "diary";
				}
			}
		}
		return result;
	}
	@ResponseBody
	@RequestMapping("findCommunicationsize.do")
	public int findCommunicationsize(String activeusername,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		String username = (String)session.getAttribute("username");
		return personalService.findCommunicationsize(username, activeusername);
	}
	
	@ResponseBody
	@RequestMapping("findCommunication.do")
	public List<Communication> findCommunication(String activeusername,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		String username = (String)session.getAttribute("username");
		List<Communication>  communication = personalService.findCommunication(username, activeusername);
		
		return communication;
	}
	@ResponseBody
	@RequestMapping("communicationspeak.do")
	public String communicationspeak(String communicationtext,String activeusername,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		String username = (String)session.getAttribute("username");
		Date time = new Date();
		Communication communication = new Communication();
		communication.setId(""+time.getTime());
		//用户发给传进来的人
		communication.setActiveusername(username);
		communication.setPassiveusername(activeusername);
		communication.setSpeaktext(communicationtext);
		communication.setTime(time);
		communication.setStatu(1);
		personalService.addCommunication(communication);
		return "";
	}
}
