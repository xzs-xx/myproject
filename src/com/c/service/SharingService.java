package com.c.service;

import java.util.List;

import com.c.etity.*;

public interface SharingService {
	public String adddiary(Diary diary);
	public String addCompositiony(Composition compositiony);
	public String addShareImage(ShareImage img);
	public List<Diary> savesharingdiary();
	public List<Composition> savesharingComposition();
	public List<ShareImage> savesharingImage();
	public String addCommentdiary(Comment comment);
	public List<Comment> findCommentList(String id);
	public String addCollection(Collection collection);
	public int saveCollection(String collectionuser, String collectionid);
	public int addFans(Fans fans);
	public int saveFans(Fans fans);
}
