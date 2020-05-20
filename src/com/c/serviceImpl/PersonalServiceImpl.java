package com.c.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.dao.*;
import com.c.etity.*;
import com.c.service.PersonalService;


@Service("PersonalService")
public class PersonalServiceImpl implements PersonalService{
	@Autowired
	private PersonalDao personalDao;
	@Override
	public List<Collection> findUserCollection(String username) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("username", username);
		return personalDao.findUserCollection(map);
	}
	@Override
	public Diary findCollectionDiary(String collectionid) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("collectionid", collectionid);
		return personalDao.findCollectionDiary(map);
	}
	@Override
	public Composition findCollectionComposition(String collectionid) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("collectionid", collectionid);
		return personalDao.findCollectionComposition(map);
	}
	@Override
	public ShareImage findCollectionimage(String collectionid) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("collectionid", collectionid);
		return personalDao.findCollectionimage(map);
	}
	@Override
	public List<Fans> findFans(String username) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("username", username);
		return personalDao.findFans(map);
	}
	@Override
	public List<Fans> findBeFans(String username) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("fansusername", username);
		return personalDao.findBeFans(map);
	}
	@Override
	public int findCommunicationsize(String username, String activeusername) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("username", username);
		map.put("activeusername", activeusername);
		return personalDao.findCommunicationsize(map).size();
	}
	@Override
	public int addCommunication(Communication communication) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", communication.getId());
		map.put("activeusername", communication.getActiveusername());
		map.put("passiveusername", communication.getPassiveusername());
		map.put("speaktext", communication.getSpeaktext());
		map.put("time", communication.getTime());
		map.put("statu", communication.getStatu());
		return personalDao.addCommunication(map);
	}
	@Override
	public List<Communication> findCommunication(String username, String activeusername) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("username", username);
		map.put("activeusername", activeusername);
		return personalDao.findCommunication(map);
	}
	@Override
	public int delcollection(String id) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", id);
		return personalDao.delcollection(map);
	}
	
	
	
}
