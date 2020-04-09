package com.c.dao;

import java.util.List;
import java.util.Map;

import com.c.etity.Collection;
import com.c.etity.Diary;

public interface SharingDao {
	public int adddiary(Map<String, Object> map);
	public int addCompositiony(Map<String, Object> map);
	public int addShareImage(Map<String, Object> map);
	public List<Diary> savesharingdiary(Map<String, Object> map);
	public int addCommentdiary(Map<String, Object> map);
	public int addCollection(Map<String, Object> map);
	public Collection saveCollection(Map<String, Object> map);
}
