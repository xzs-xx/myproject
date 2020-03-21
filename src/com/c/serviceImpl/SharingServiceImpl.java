package com.c.serviceImpl;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.dao.SharingDao;
import com.c.etity.Diary;
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
}
