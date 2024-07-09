package com.ekqlsart.ekqls.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ekqlsart.ekqls.dto.board;

@Repository
public class BoardDao1Impl implements BoardDao1 {
	
	@Autowired
	SqlSession session;
	
	String namespace = "com.ekqlsart.ekqls.board.";
	 
	    @Override
		public int insertBoard(board dto) {
	        return session.insert("insertBoard", dto);
	    }

	   
	    @Override
		public int deleteBoard(board dto) {
	        return session.delete("deleteBoard", dto);
	    }

	   
	    @Override
		public List<board> selectList(String food) {
	        return session.selectList("selectList", food);
	    }

	   
	    @Override
		public List<board> selectlikeb(String id) {
	        return session.selectList("selectlikeb", id);
	    }

	    
	    @Override
		public List<board> selectCommentBoard(String commenter) {
	        return session.selectList("selectcommentb", commenter);
	    }

	    
	    @Override
		public board selectNum(int num) {
	        return session.selectOne("selectNum", num);
	    }

	    
	    @Override
		public int updateBoard(board dto) {
	        return session.update("updateBoard", dto);
	    }

	    
	    @Override
		public board selectBoard(int num) {
	        return session.selectOne("selectBoard", num);
	    }

	    
	    @Override
		public board selectBoard1(int num) {
	        return session.selectOne("selectBoard1", num);
	    }

	    
	    @Override
		public int updateCommentCnt1(Map<String, Object> map) {
	        return session.update("updateCommentCnt1", map);
	    }

	    
	    @Override
		public int updateLikeCnt(Map<String, Object> map) {
	        return session.update("updateLikeCnt", map);
	    }

	    
	    @Override
		public int selectAvg(int num) {
	        return session.selectOne("selectAvg", num);
	    }
	}