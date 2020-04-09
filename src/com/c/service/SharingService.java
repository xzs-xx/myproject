package com.c.service;

import java.util.List;

import com.c.etity.*;

public interface SharingService {
	public String adddiary(Diary diary);
	public String addCompositiony(Compositiony compositiony);
	public String addShareImage(ShareImage img);
	public List<Diary> savesharingdiary();
	public String addCommentdiary(Comment comment);
	public String addCollection(Collection collection);
	public int saveCollection(String collectionuser, String collectionid);
}
