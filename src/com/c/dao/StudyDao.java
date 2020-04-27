package com.c.dao;
import java.util.List;
import java.util.Map;

import com.c.etity.*;
public interface StudyDao {
	List<Book> findBook(Map<String, Object> map);
}
