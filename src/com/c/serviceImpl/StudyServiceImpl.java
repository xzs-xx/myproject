package com.c.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.dao.StudyDao;
import com.c.etity.Book;
import com.c.service.StudyService;
@Service("StudyService")
public class StudyServiceImpl implements StudyService{
	@Autowired
	private StudyDao studyDao;
	@Override
	public List<Book> findBook() {
		Map<String, Object> map =new HashMap<String, Object>();
		return studyDao.findBook(map);
	}

}
