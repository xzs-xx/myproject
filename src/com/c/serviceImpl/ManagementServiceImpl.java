package com.c.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.dao.ManagementDao;
import com.c.etity.Composition;
import com.c.etity.Diary;
import com.c.etity.ShareImage;
import com.c.service.*;


@Service("ManagementService")
public class ManagementServiceImpl implements ManagementService{
	@Autowired
	private ManagementDao managementDao;
	@Override
	public List<Diary> findUserDiary(String username) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("username", username);
		return managementDao.findUserDiary(map);
	}
	@Override
	public List<Composition> findUserComposition(String username) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("username", username);
		return managementDao.findUserComposition(map);
	}
	@Override
	public List<ShareImage> findUserShareImage(String username) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("username", username);
		return managementDao.findUserShareImage(map);
	}
	@Override
	public int updatediarystatu(String id, int statu) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", id);
		map.put("statu", statu);
		return managementDao.updatediarystatu(map);
	}
	@Override
	public int updatecompositionstatu(String id, int statu) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", id);
		map.put("statu", statu);
		return managementDao.updatecompositionstatu(map);
	}
	@Override
	public int updateshareimagestatu(String id, int statu) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", id);
		map.put("statu", statu);
		return managementDao.updateshareimagestatu(map);
	}
	
	
}
