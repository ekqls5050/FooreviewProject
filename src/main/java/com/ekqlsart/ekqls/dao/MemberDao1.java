package com.ekqlsart.ekqls.dao;

import java.util.List;
import java.util.Map;

import com.ekqlsart.ekqls.dto.member;

public interface MemberDao1 {

	int insertMember(member dto) throws Exception;

	member mypage(String id) throws Exception;

	member admin(String id) throws Exception;

	member selectMember(String id) throws Exception;

	member selectnickname(String nickname) throws Exception;

	int updateMember(member dto) throws Exception;
	
	public int updateMember2(member dto) throws Exception;

	public int updatepw(member dto) throws Exception;
	
	int iddelete(String id) throws Exception;

	public List<member> selectAll1() throws Exception;
	
	public member selectcheckid(member dto) throws Exception;
	
	public member selectcheckpw(member dto) throws Exception;
}