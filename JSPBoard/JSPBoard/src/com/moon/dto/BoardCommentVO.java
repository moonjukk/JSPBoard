package com.moon.dto;

import java.sql.Timestamp;

public class BoardCommentVO {
	private int pboard;
	private String cid;
	private String cpw;
	private String comments;
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	private Timestamp wdate;
	
	public Timestamp getWdate() {
		return wdate;
	}
	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}
	public int getPboard() {
		return pboard;
	}
	public void setPboard(int pboard) {
		this.pboard = pboard;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCpw() {
		return cpw;
	}
	public void setCpw(String cpw) {
		this.cpw = cpw;
	}
}
