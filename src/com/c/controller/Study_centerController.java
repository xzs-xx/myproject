package com.c.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.etity.*;
import com.c.service.StudyService;

@Controller
public class Study_centerController {
	@Autowired
	private StudyService studyService;
	@RequestMapping("study_center.do")
	public String Study_center(HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		List<Book> books = studyService.findBook();
		req.setAttribute("books", books);
		return "study_center";
	}
	@ResponseBody
	@RequestMapping("findonebook.do")
	public String findoneBook(String id,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		Book book = studyService.findoneBook(id);
		session.setAttribute("book", book);
		return "study_center_book.do";
	}
	@RequestMapping("study_center_book.do")
	public String stdy_center_book(HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		req.setAttribute("book",session.getAttribute("book"));
		session.removeAttribute("book");
		return "study_center_book";
	}
	
	@ResponseBody
	@RequestMapping("addnotes.do")
	public String addnotes(String notesbookid ,int notespage ,String notestext,
			HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		Date notestime = new Date();
		String id = "" + notestime.getTime();
		Notes notes = new Notes();
		notes.setId(id);
		notes.setNotesbookname((String)session.getAttribute("username"));
		notes.setNotesbookid(notesbookid);
		notes.setNotespage(notespage);
		notes.setNotestext(notestext);
		notes.setNotestime(notestime);
		studyService.addnotes(notes);
		return "";
	}
	@ResponseBody
	@RequestMapping("findnotes.do")
	public List<Notes> findnotes(String notesbookid,int notespage,
			HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		return studyService.findNotes((String)session.getAttribute("username") , notesbookid, notespage);
	}
	@ResponseBody
	@RequestMapping("delnotes.do")
	public String delnotes(String id,HttpServletResponse rep,HttpServletRequest req,HttpSession session) {
		String str = "删除失败";
		if(studyService.delnotes(id)==1) {
			str = "删除成功";
		}
		return str;
	}
}
