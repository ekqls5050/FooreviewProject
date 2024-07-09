package com.greenart.green;

import static org.junit.Assert.assertTrue;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DBConnectionTestTest {
	
	@Autowired
	DataSource ds;
	
	@Test
	public void test() throws Exception{
		Connection con =ds.getConnection();
		assertTrue(con!=null);
	}

}
