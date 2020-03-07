package com.c.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.dao.MusicDao;
import com.c.etity.Music;
import com.c.etity.Story;
import com.c.etity.Video;
import com.c.service.*;
@Service("MusicService")
public class MusicServiceImpl implements MusicService{
	
	@Autowired
	private MusicDao musicDao;
	@Override
	public List<Music> findMusic() {
		List<Music> m = musicDao.findMusic();
		return m;
	}
	@Override
	public List<Story> findStory() {
		List<Story> s = musicDao.findStory();
		return s;
	}
	@Override
	public List<Video> findVideo() {
		List<Video> v = musicDao.findVideo();
		System.out.println(v.size());
		return v;
	}
	
}
