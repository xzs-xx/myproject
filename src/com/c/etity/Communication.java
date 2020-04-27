package com.c.etity;

import java.util.Date;

public class Communication {
	private String id;
	private String activeusername;
	private String passiveusername;
	private String speaktext;
	private Date time;
	private int statu;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getActiveusername() {
		return activeusername;
	}
	public void setActiveusername(String activeusername) {
		this.activeusername = activeusername;
	}
	public String getPassiveusername() {
		return passiveusername;
	}
	public void setPassiveusername(String passiveusername) {
		this.passiveusername = passiveusername;
	}
	public String getSpeaktext() {
		return speaktext;
	}
	public void setSpeaktext(String speaktext) {
		this.speaktext = speaktext;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getStatu() {
		return statu;
	}
	public void setStatu(int statu) {
		this.statu = statu;
	}
	
}
