package com.ekqlsart.ekqls.dao;

import java.util.List;
import java.util.Map;

import com.ekqlsart.ekqls.dto.board;

public interface BoardDao1 {

	int insertBoard(board dto);

	int deleteBoard(board dto);

	List<board> selectList(String food);

	List<board> selectlikeb(String id);

	List<board> selectCommentBoard(String commenter);

	board selectNum(int num);

	int updateBoard(board dto);

	board selectBoard(int num);

	board selectBoard1(int num);

	int updateCommentCnt1(Map<String, Object> map);

	int updateLikeCnt(Map<String, Object> map);

	int selectAvg(int num);

}