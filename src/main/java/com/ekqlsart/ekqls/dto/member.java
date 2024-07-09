package com.ekqlsart.ekqls.dto;

public class member {
	private String id;
	private String name;
	private String email;
	private String birth;
	private String pwd;
	private String pwdcon;
	private String nickname;
	private String area;
	
	public String getPwdcon() {
		return pwdcon;
	}
	public void setPwdcon(String pwdcon) {
		this.pwdcon = pwdcon;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}

	
	public member(String id, String name, String email, String birth, String pwd, String pwdcon, String nickname,
			String area) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.pwd = pwd;
		this.pwdcon = pwdcon;
		this.nickname = nickname;
		this.area = area;
	}
	@Override
	public String toString() {
		return "member [id=" + id + ", name=" + name + ", email=" + email + ", birth=" + birth + ", pwd=" + pwd
				+ ", pwdcon=" + pwdcon + ", nickname=" + nickname + ", area=" + area + "]";
	}
	public member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
