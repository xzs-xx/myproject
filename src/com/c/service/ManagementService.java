package com.c.service;
import java.util.List;
import java.util.Map;

import com.c.etity.*;

public interface ManagementService {
	List<Diary> findUserDiary(String username);
	int updatediarystatu(String id,int statu);
}
