package com.c.etity;

import java.util.Date;

public class Notes {
	private String id;
	private String notesbookname;
	private String notesbookid;
	private int notespage;
	private String notestext;
	private Date notestime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNotesbookid() {
		return notesbookid;
	}
	public String getNotesbookname() {
		return notesbookname;
	}
	public void setNotesbookname(String notesbookname) {
		this.notesbookname = notesbookname;
	}
	public void setNotesbookid(String notesbookid) {
		this.notesbookid = notesbookid;
	}
	public int getNotespage() {
		return notespage;
	}
	public void setNotespage(int notespage) {
		this.notespage = notespage;
	}
	public String getNotestext() {
		return notestext;
	}
	public void setNotestext(String notestext) {
		this.notestext = notestext;
	}
	public Date getNotestime() {
		return notestime;
	}
	public void setNotestime(Date notestime) {
		this.notestime = notestime;
	}
}
