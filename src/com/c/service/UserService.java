package com.c.service;

import com.c.etity.User;

public interface UserService {
	String findUser(String username, String password);
	String addApplyUser(User user);
}