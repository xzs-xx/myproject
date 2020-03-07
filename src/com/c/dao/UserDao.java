package com.c.dao;

import java.util.Map;

public interface UserDao {
	Map<String, Object> findUser(Map<String, Object> map);
	int addApplyUser(Map<String, Object> map);
}
