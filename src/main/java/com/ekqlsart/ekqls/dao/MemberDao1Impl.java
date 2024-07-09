package com.ekqlsart.ekqls.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ekqlsart.ekqls.dto.member;


@Repository
public class MemberDao1Impl implements MemberDao1 {

	@Autowired
	SqlSession session;
	
	String namespace = "com.ekqlsart.ekqls.member.";
	
	@Override
	public int insertMember(member dto) throws Exception{
		return session.insert(namespace+"insert",dto);
	}
	@Override
	public member mypage(String id) throws Exception {
	    return session.selectOne(namespace + "mypage", id);
	}
	@Override
	public member admin(String id) throws Exception {
	    return session.selectOne(namespace + "admin", id);
	}
	@Override
	public member selectMember(String id) throws Exception {
	    return session.selectOne(namespace + "selectMember", id);
	}
	@Override
	public member selectnickname(String nickname) throws Exception {
	    return session.selectOne(namespace + "selectnickname", nickname);
	}
	@Override
	public int updateMember(member dto) throws Exception {
	    return session.update(namespace + "updateMember", dto);
	}
	@Override
	public int updateMember2(member dto) throws Exception {
	    return session.update(namespace + "updateMember2", dto);
	}
	@Override
	public int updatepw(member dto) throws Exception {
	    return session.update(namespace + "updatepw", dto);
	}
	@Override
	public int iddelete(String id) throws Exception {
	    return session.delete(namespace + "iddelete", id);
	}
	@Override
	public List<member> selectAll1() throws Exception {
	    return session.selectList(namespace + "selectAll1");
	}
    @Override
    public member selectcheckid(member dto) throws Exception {
        return session.selectOne(namespace + "selectcheckid", dto);
    }
    @Override
    public member selectcheckpw(member dto) throws Exception {
        return session.selectOne(namespace + "selectcheckid", dto);
    }
}
