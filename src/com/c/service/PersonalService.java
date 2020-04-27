package com.c.service;

import java.util.List;
import java.util.Map;

import com.c.etity.*;

public interface PersonalService {
	List<Collection> findUserCollection(String username);
	Diary findCollectionDiary(String collectionid);
	List<Fans> findFans(String username);
	List<Fans> findBeFans(String username);
	int findCommunicationsize(String username,String activeusername);
	List<Communication> findCommunication(String username,String activeusername);
	int addCommunication(Communication communication);
}
