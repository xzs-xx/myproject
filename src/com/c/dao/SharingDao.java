package com.c.dao;

import java.util.List;
import java.util.Map;

import com.c.etity.*;

public interface SharingDao {
	public int adddiary(Map<String, Object> map);
	public int addCompositiony(Map<String, Object> map);
	public int addShareImage(Map<String, Object> map);
	public List<Diary> savesharingdiary(Map<String, Object> map);
	public List<Composition> savesharingComposition(Map<String, Object> map);
	public List<ShareImage> savesharingImage(Map<String, Object> map);
	public int addCommentdiary(Map<String, Object> map);
	public List<Comment> findCommentList(Map<String, Object> map);
	public int addCollection(Map<String, Object> map);
	public Collection saveCollection(Map<String, Object> map);
	public int addFans(Map<String, Object> map);
	public Fans saveFans(Map<String, Object> map);
}
