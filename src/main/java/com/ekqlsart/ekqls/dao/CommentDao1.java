package com.ekqlsart.ekqls.dao;

import java.util.List;
import java.util.Map;

import com.ekqlsart.ekqls.dto.comment;
import com.ekqlsart.ekqls.dto.member;

public interface CommentDao1 {

	boolean hasReviewed(Map<String, Object> map);

	List<comment> selectAll(int bno);

	comment selectComment(int cno);

	int insertcomment(comment dto);

	int selectCommentCount(int bno);

	int idupdate(member dto);

	int deleteComment(Map<String, Object> map);

	int deleteCommentByBno(Map<String, Object> map);

	int updateComment(comment dto);

	int selectidc(String commenter);

	List<Map<String, Object>> selectCommenterReviewCounts();

}