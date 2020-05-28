package com.c.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.dao.StudyDao;
import com.c.etity.Book;
import com.c.etity.Notes;
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
	@Override
	public Book findoneBook(String id) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", id);
		return studyDao.findoneBook(map);
	}
	@Override
	public int addnotes(Notes notes) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", notes.getId());
		map.put("notesbookname", notes.getNotesbookname());
		map.put("notesbookid", notes.getNotesbookid());
		map.put("notespage", notes.getNotespage());
		map.put("notestext", notes.getNotestext());
		map.put("notestime", notes.getNotestime());
		studyDao.addnotes(map);
		return 0;
	}
	@Override
	public List<Notes> findNotes(String notesbookname, String notesbookid, int notespage) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("notesbookname", notesbookname);
		map.put("notesbookid", notesbookid);
		map.put("notespage", notespage);
		return studyDao.findNotes(map);
	}
	@Override
	public int delnotes(String id) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", id);
		return studyDao.delnotes(map);
	}

}
