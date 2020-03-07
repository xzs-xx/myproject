package com.c.service;

import java.util.List;

import com.c.etity.*;

public interface MusicService {
	List<Music> findMusic();
	List<Story> findStory();
	List<Video> findVideo();
}
