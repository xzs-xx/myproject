package com.c.serviceImpl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.dao.SharingDao;
import com.c.etity.Comment;
import com.c.etity.Compositiony;
import com.c.etity.Diary;
import com.c.etity.ShareImage;
import com.c.service.*;

@Service("SharingService")
public class SharingServiceImpl implements SharingService{
	@Autowired
	private SharingDao sharingDao;
	public String adddiary(Diary diary) {
		String s = "保存失败";
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", diary.getId());
		map.put("username", diary.getUsername());
		map.put("title", diary.getTitle());
		map.put("text", diary.getText());
		map.put("time", diary.getTime());
		map.put("statu", diary.getStatu());
		int i = sharingDao.adddiary(map);
		if(i==1)s = "保存成功";
		return s;
	}
	@Override
	public String addCompositiony(Compositiony compositiony) {
		String s = "保存失败";
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", compositiony.getId());
		map.put("username", compositiony.getUsername());
		map.put("title", compositiony.getTitle());
		map.put("src", compositiony.getSrc());
		map.put("time", compositiony.getDate());
		map.put("statu", compositiony.getStatu());
		int i = sharingDao.addCompositiony(map);
		if(i==1)s = "保存成功";
		return s;
	}
	@Override
	public String addShareImage(ShareImage img) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", img.getId());
		map.put("username", img.getUsername());
		map.put("title", img.getTitle());
		map.put("src", img.getSrc());
		map.put("time", img.getTime());
		map.put("statu", img.getStatu());
		int i = sharingDao.addShareImage(map);
		return "sharing_center";
	}
	@Override
	public List<Diary> savesharingdiary() {
		Map<String, Object> map =new HashMap<String, Object>();
		return sharingDao.savesharingdiary(map);
	}
	@Override
	public String addCommentdiary(Comment comment) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", comment.getId());
		map.put("commentuser", comment.getCommentuser());
		map.put("commentid", comment.getCommentid());
		map.put("commenttext", comment.getCommenttext());
		map.put("commenttype", comment.getCommenttype());
		map.put("time", comment.getTime());
		sharingDao.addCommentdiary(map);
		return "";
	}
	
	
}
