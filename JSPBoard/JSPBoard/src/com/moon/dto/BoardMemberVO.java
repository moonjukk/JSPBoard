package com.moon.dto;

public class BoardMemberVO {
	//private int no;
	private String id;
	private String pw;
	private String name;
	private String phonenum;

	/*
	 * public int getNo() { return no; } public void setNo(int no) { this.no = no; }
	 */
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	
	
}
