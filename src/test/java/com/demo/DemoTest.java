package com.demo;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.maximus.service.BaseService;

public class DemoTest {
	private static Logger logger = LoggerFactory.getLogger(DemoTest.class);

	private static BaseService baseService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		// 获取baseService
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("context-main.xml");
		baseService = context.getBean("baseService", BaseService.class);

	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Test
	public void test() throws Exception {

		logger.debug("~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
	}

}
