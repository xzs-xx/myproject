package com.c.dao;

import java.util.List;
import java.util.Map;
import com.c.etity.*;
public interface PersonalDao {
	List<Collection> findUserCollection(Map<String, Object> map);
	Diary findCollectionDiary(Map<String, Object> map);
	Composition findCollectionComposition(Map<String, Object> map);
	ShareImage findCollectionimage(Map<String, Object> map);
	List<Fans> findFans(Map<String, Object> map);
	List<Fans> findBeFans(Map<String, Object> map);
	List<Communication> findCommunicationsize(Map<String, Object> map);
	List<Communication> findCommunication(Map<String, Object> map);
	int addCommunication(Map<String, Object> map);
	int delcollection(Map<String, Object> map);
}
