package com.c.dao;
import java.util.List;
import java.util.Map;

import com.c.etity.*;
public interface StudyDao {
	List<Book> findBook(Map<String, Object> map);
	Book findoneBook(Map<String, Object> map);
	int addnotes(Map<String, Object> map);
	List<Notes> findNotes(Map<String, Object> map);
	int delnotes(Map<String, Object> map);
}
