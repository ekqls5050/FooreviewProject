package com.ekqlsart.ekqls.dto;

public class likeboard {
	private int num;
	private String id;
	private int bno;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "likeboard [num=" + num + ", id=" + id + ", bno=" + bno + "]";
	}
	public likeboard(int num, String id, int bno) {
		super();
		this.num = num;
		this.id = id;
		this.bno = bno;
	}
	public likeboard() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
