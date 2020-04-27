package com.c.serviceImpl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.dao.SharingDao;
import com.c.etity.Collection;
import com.c.etity.Comment;
import com.c.etity.Compositiony;
import com.c.etity.Diary;
import com.c.etity.Fans;
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
	@Override
	public String addCollection(Collection collection) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id",collection.getId());
		map.put("collectionuser",collection.getCollectionuser());
		map.put("collectionid", collection.getCollectionid());
		map.put("collectiontype", collection.getCollectiontype());
		map.put("collectiontime", collection.getCollectiontime());
		sharingDao.addCollection(map);
		return "";
	}
	@Override
	public int saveCollection(String collectionuser, String collectionid) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("collectionuser",collectionuser);
		map.put("collectionid", collectionid);
		Collection collection = sharingDao.saveCollection(map);
		if(collection == null)return 0;
		return 1;
	}
	@Override
	public int addFans(Fans fans) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", fans.getId());
		map.put("username", fans.getUsername());
		map.put("fansusername", fans.getFansusername());
		return sharingDao.addFans(map);
	}
	@Override
	public int saveFans(Fans fans) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", fans.getId());
		map.put("username", fans.getUsername());
		map.put("fansusername", fans.getFansusername());
		Fans fans1 = sharingDao.saveFans(map);
		if(fans1!=null)return 1;
		return 0;
	}
	
	
}
