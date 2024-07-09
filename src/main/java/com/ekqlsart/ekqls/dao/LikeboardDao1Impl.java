package com.ekqlsart.ekqls.dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeboardDao1Impl implements LikeboardDao1 {
	@Autowired
	SqlSession session;
	
	String namespace = "com.ekqlsart.ekqls.likeboard.";
	@Override
	public int insertLike(Map<String, Object> map) {
        return session.insert("insertLike", map);
    }

    @Override
	public int deleteLike(Map<String, Object> map) {
        return session.delete("deleteLike", map);
    }

    @Override
	public int selectLikeCount(int bno) {
        return session.selectOne("selectLikeCount", bno);
    }

    @Override
	public int selectLike(Map<String, Object> map) {
        return session.selectOne("selectLike", map);
    }

    @Override
	public int selectidl(String id) {
        return session.selectOne("selectidl", id);
    }
	}
