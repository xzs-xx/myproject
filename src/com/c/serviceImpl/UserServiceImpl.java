package com.c.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.dao.UserDao;
import com.c.etity.User;
import com.c.service.UserService;

@Service("UserService")
public class UserServiceImpl implements  UserService{
	@Autowired
	private UserDao userDao;

	@Override
	public String findUser(String username, String password) {
		
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("password", password);
		map.put("username", username);
		Map<String,Object> map2= userDao.findUser(map);
		System.out.print(map2);
		if(map2!= null){
			String dl = (String) map2.get("pos");
			return dl;
		}else{
			return "登录失败！";
		}
	}
	@Override
	public String addApplyUser(User user) {
		// TODO Auto-generated method stub
		Map<String, Object> map =new HashMap<String, Object>();

		map.put("id",user.getId());
		map.put("username",user.getUsername());
		map.put("password", user.getPassword());
		map.put("email", user.getEmail());
		map.put("tel",user.getTel());
		map.put("portrait", user.getPortrait());
		map.put("pos", user.getPos());
		int map2= userDao.addApplyUser(map);
		if(map2==1) {
			return "1";
		}else return "注册失败";
	}
}