package com.ekqlsart.ekqls.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ekqlsart.ekqls.dto.comment;
import com.ekqlsart.ekqls.dto.member;

@Repository
public class CommentDao1Impl implements CommentDao1 {
	@Autowired
	SqlSession session;
	
	String namespace = "com.ekqlsart.ekqls.comment.";
	 @Override
	public boolean hasReviewed(Map<String, Object> map) {
	        return session.selectOne("hasReivewed", map);
	    }

	    @Override
		public List<comment> selectAll(int bno) {
	        return session.selectList("selectAll", bno);
	    }

	    @Override
		public comment selectComment(int cno) {
	        return session.selectOne("selectComment", cno);
	    }

	    @Override
		public int insertcomment(comment dto) {
	        return session.insert("insertcomment", dto);
	    }

	    @Override
		public int selectCommentCount(int bno) {
	        return session.selectOne("selectCommentCount", bno);
	    }

	    @Override
		public int idupdate(member dto) {
	        return session.update("idupdate", dto);
	    }

	    @Override
		public int deleteComment(Map<String, Object> map) {
	        return session.delete("delete", map);
	    }

	    @Override
		public int deleteCommentByBno(Map<String, Object> map) {
	        return session.delete("deleteComment", map);
	    }

	    @Override
		public int updateComment(comment dto) {
	        return session.update("updateComment", dto);
	    }

	    @Override
		public int selectidc(String commenter) {
	        return session.selectOne("selectidc", commenter);
	    }
		@Override
	    public List<Map<String, Object>> selectCommenterReviewCounts() {
	        return session.selectList(namespace + "stndth");
	    }
	   
	}