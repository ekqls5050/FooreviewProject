package com.ekqlsart.ekqls.dto;

public class board {
	private int num;
	private String title;
	private String addr;
	private String phone;
	private int likeCnt;
	private double star;
	private int commentCnt;
	private String food;
	private String hm;
	private String 	filename;
	private double avg_star;
	
	public board(int num, String title, String addr, String phone, int likeCnt, double star, int commentCnt,
			String food, String hm,String filename, double avg_star) {
		super();
		this.num = num;
		this.title = title;
		this.addr = addr;
		this.phone = phone;
		this.likeCnt = likeCnt;
		this.star = star;
		this.commentCnt = commentCnt;
		this.food = food;
		this.hm = hm;
		this.filename = filename;
		this.avg_star = avg_star;
	}

	public double getAvg_star() {
		
		return Math.round(avg_star * 10) / 10.0;
	}

	public void setAvg_star(double avg_star) {
		this.avg_star = avg_star;
	}

	public board(int num, String title, String addr, String phone, String food, String hm) {
		super();
		this.num = num;
		this.title = title;
		this.addr = addr;
		this.phone = phone;
		this.food = food;
		this.hm = hm;
	}
	
	public String getHm() {
		return hm;
	}
	public void setHm(String hm) {
		this.hm = hm;
	}
	public board(int num) {
		super();
		this.num = num;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public board(int num, String title, String addr, String phone, int likeCnt, double star, int commentCnt, String food,String hm) {
		super();
		this.num = num;
		this.title = title;
		this.addr = addr;
		this.phone = phone;
		this.likeCnt = likeCnt;
		this.star = star;
		this.commentCnt = commentCnt;
		this.food = food;
		this.hm = hm;
	}
	


	@Override
	public String toString() {
		return "board [num=" + num + ", title=" + title + ", addr=" + addr + ", phone=" + phone + ", likeCnt=" + likeCnt
				+ ", star=" + star + ", commentCnt=" + commentCnt + ", food=" + food + ", hm=" + hm + ", filename="
				+ filename + ", avg_star=" + avg_star + "]";
	}

	public board(String title, String addr, String phone, String food, String hm) {
		super();
		this.title = title;
		this.addr = addr;
		this.phone = phone;
		this.food = food;
		this.hm = hm;
	}
	public board() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
