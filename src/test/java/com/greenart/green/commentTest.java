package com.greenart.green;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ekqlsart.ekqls.dao.MemberDao1;
import com.ekqlsart.ekqls.dto.member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class commentTest {

	@Autowired
	MemberDao1 dao;
	
	//@Test
	public void insert() throws Exception {
		member dto = new member("qwerr","이다빈","ekqls5050@naver.com","1999-01-19","qwer","닉네임", "충북 청주시 상당구","qwer");
		assertTrue(dao.insertMember(dto)==1);
	}

	//@Test
	public void selectId() throws Exception{
		member dto = dao.selectMember("qwerr");
		assertTrue("qwerr".equals(dto.getId()));
	}
	
	@Test
	public void delete() throws Exception{
		assertTrue(dao.iddelete("qwerr")==1);
	}
	

}