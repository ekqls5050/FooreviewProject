package com.ekqlsart.ekqls.dao;

import java.util.Map;

public interface LikeboardDao1 {

	int insertLike(Map<String, Object> map);

	int deleteLike(Map<String, Object> map);

	int selectLikeCount(int bno);

	int selectLike(Map<String, Object> map);

	int selectidl(String id);

}