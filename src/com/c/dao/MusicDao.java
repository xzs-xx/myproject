package com.c.dao;
import java.util.List;
import com.c.etity.*;
public interface MusicDao {
	List<Music> findMusic();
	List<Story> findStory();
	List<Video> findVideo();
}
