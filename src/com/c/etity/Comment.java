package com.c.etity;

import java.util.Date;

public class Comment {
	private String id;
	private String commentuser;
	private String commentid;
	private String commenttext;
	private String commenttype;
	private Date time;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCommentuser() {
		return commentuser;
	}
	public void setCommentuser(String commentuser) {
		this.commentuser = commentuser;
	}
	public String getCommentid() {
		return commentid;
	}
	public void setCommentid(String commentid) {
		this.commentid = commentid;
	}
	public String getCommenttext() {
		return commenttext;
	}
	public void setCommenttext(String commenttext) {
		this.commenttext = commenttext;
	}
	public String getCommenttype() {
		return commenttype;
	}
	public void setCommenttype(String commenttype) {
		this.commenttype = commenttype;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
}
