package com.c.dao;

import java.util.List;
import java.util.Map;

import com.c.etity.*;

public interface ManagementDao {
	List<Diary> findUserDiary(Map<String, Object> map);
	List<Composition> findUserComposition(Map<String, Object> map);
	List<ShareImage> findUserShareImage(Map<String, Object> map);
	int updatediarystatu(Map<String, Object> map);
	int updatecompositionstatu(Map<String, Object> map);
	int updateshareimagestatu(Map<String, Object> map);
}
