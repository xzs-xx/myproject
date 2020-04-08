package com.c.dao;

import java.util.List;
import java.util.Map;

import com.c.etity.Diary;

public interface ManagementDao {
	List<Diary> findUserDiary(Map<String, Object> map);
	int updatediarystatu(Map<String, Object> map);
}
