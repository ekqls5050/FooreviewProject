package com.ekqlsart.ekqls.dto;

import java.util.Date;

public class comment {
	private int cno;
	private int bno;
	private String comment;
	private String commenter;
	private Date reg_date;
	private double star;
	public comment(int bno) {
		super();
		this.bno = bno;
	}
	public comment(int bno, String comment, String commenter, double star) {
		super();
		this.bno = bno;
		this.comment = comment;
		this.commenter = commenter;
		this.star = star;
	}
	public comment(int cno, String comment, Date reg_date, double star) {
		super();
		this.cno = cno;
		this.comment = comment;
		this.reg_date = reg_date;
		this.star = star;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "comment [cno=" + cno + ", bno=" + bno + ", comment=" + comment + ", commenter=" + commenter
				+ ", reg_date=" + reg_date + ", star=" + star + "]";
	}
	public comment(int cno, int bno, String comment, String commenter, Date reg_date, double star) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.comment = comment;
		this.commenter = commenter;
		this.reg_date = reg_date;
		this.star = star;
	}
	public comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
