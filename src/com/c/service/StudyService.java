package com.c.service;
import java.util.List;

import com.c.etity.*;

public interface StudyService {
	public List<Book> findBook();
	public Book findoneBook(String id);
	public int addnotes(Notes notes);
	public List<Notes> findNotes(String notesbookname,String notesbookid,int notespage);
	public int delnotes(String id);
}
